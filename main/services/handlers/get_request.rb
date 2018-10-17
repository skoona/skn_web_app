# ##
#
# Handle Temporary File Response
# Services::Handlers::GetRequest

module Services
  module Handlers

    class GetRequest
      def self.call(uri, options={})
        new(options).call(uri)
      end

      def initialize(options={})
        @_file_handler = options.fetch(:file_handler,
                                       SknApp.config.registry.resolve(:file_handler))
        @api_username  = options.fetch(:api_user, SknSettings.content_service.username)
        @api_password  = options.fetch(:api_pass, SknSettings.content_service.password)
        @content_read_timeout      = SknSettings.content_service.read_timeout_seconds
        @content_open_wait_timeout = SknSettings.content_service.open_timeout_seconds
      end


      # SknSuccess or SknFailure
      def call(uri)
        completion = nil

        request = Net::HTTP::Get.new(uri.request_uri)
        request.basic_auth(@api_username, @api_password)

        response = Net::HTTP.start(uri.host, uri.port) do |http|
          http.open_timeout = @content_open_wait_timeout          # in seconds, for internal http timeouts
          http.read_timeout = @content_read_timeout                    # in seconds
          http.request(request)
        end

        if ( response.kind_of?(Net::HTTPClientError) or response.kind_of?(Net::HTTPServerError) )
          completion = SknFailure.call(self.class.name, "#{response.code}:#{response.message}")

        elsif response['content-disposition']&.include?('filename=')
          completion = @_file_handler.call(response)

        else
          completion = SknSuccess.call(response.body)
        end

        completion
      end

    end # end class
  end
end
