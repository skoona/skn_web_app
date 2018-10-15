# ##
# File: ./strategy/services/content/command_handler.rb
# ##

# ##
# SknServices APIs
# ##
# resources :profiles, only: :none do
#   collection do
#     get :api_in_action                   :username
#     get :api_get_demo_content_object     :id, :username, :content_type
#   end
# end



module Services
  module Content

    class CommandHandler
      include Authentication::CacheProvider

      def self.call(command)
        self.new().call(command)
      end

      def call(cmd)
        model = @commands.key?(cmd.class) && cmd.valid? ? @commands[cmd.class].call(cmd) : @unknown
        model = Models::Failure.new( model ) unless model[:success]
        duration = "%3.1f seconds" % (Time.now.getlocal.to_f - @_start_time.to_f)
        logger.info "#{self.class.name}##{__method__} Command: #{cmd.class.name.split('::').last}, Returned: #{model.class.name.split('::').last}, Status: #{model.success}, Duration: #{duration}"
        model
      rescue StandardError => e
        duration = "%3.1f seconds" % (Time.now.getlocal.to_f - @_start_time.to_f)
        logger.warn "#{self.class.name}##{__method__} Failure Request: Provider: #{@description}, klass=#{e.class.name}, cause=#{e.message}, Duration: #{duration}, Backtrace=#{e.backtrace[0..1]}"
        Models::Failure.new({success: false, message: "#{e.message}, Duration: #{duration}", payload: []})
      end

    private

      def initialize
        @_start_time = Time.now.getlocal
        @host_and_port = SknSettings.content_service.url
        @api_username  = SknSettings.content_service.username
        @api_password  = SknSettings.content_service.password
        @description   = SknSettings.content_service.description
        @content_read_timeout = SknSettings.content_service.read_timeout_seconds
        @content_open_wait_timeout = SknSettings.content_service.open_timeout_seconds
        @commands = {
            Services::Content::Commands::RetrieveAvailableResources  => method(:resources_metadata),
            Services::Content::Commands::RetrieveResourceContent  => method(:resource_content)
        }
        @unknown = {success: false, message: "#{@description}: Unknown Request type", payload: []}
      end

      def resources_metadata(cmd)
        # :username is only param
        resp = fetch_object(cmd.storage_key)
        if resp.nil?
          resp = request_metadata(cmd.uri)
          cache_object(cmd.storage_key, resp)
        end
        Object.const_get(cmd.model).new( resp['package'] )
      rescue StandardError => e
        logger.warn "#{self.class.name}##{__method__} Failure Request: Provider: #{@description}, klass=#{e.class.name}, cause=#{e.message}, Backtrace=#{e.backtrace[0..1]}"
        raise MetaDataRequestFailed, "#{@description}, #{e.class.name}:#{e.message}"
      end

      def resource_content(cmd)
        resp = request_content(cmd.uri)
        logger.info "#{__method__}: Returns => #{resp[:filename]} as: #{resp[:payload]}, with #{resp[:message]}"
        Object.const_get(cmd.model).new( resp )
      rescue StandardError => e
        logger.warn "#{self.class.name}##{__method__} Failure Request: Provider: #{@description}, klass=#{e.class.name}, cause=#{e.message}, Backtrace=#{e.backtrace[0..1]}"
        raise ContentRequestFailed, "#{@description}, #{e.class.name}:#{e.message}"
      end

      def logger
        @_logger ||= (Logging.logger['CMD'] || SknApp.logger)
      end

      def request_metadata(uri)
        JSON.parse( do_request(uri) )
      end

      def request_content(uri)
        do_request(uri, true)
      end

      def do_request(uri, content=false)
        request = Net::HTTP::Get.new(uri.request_uri)
        request.basic_auth(@api_username, @api_password)

        # Execute the request object and get response
        # - HTTP's *_timeout methods will THROW a Timeout:Error exception
        # - HTTP's internal HTTP<Error> will be returned Inline for all other errors without raising it
        response = Net::HTTP.start(uri.host, uri.port) do |http|
          http.open_timeout = @content_open_wait_timeout          # in seconds, for internal http timeouts
          http.read_timeout = @content_read_timeout                    # in seconds
          http.request(request)
        end

        if ( response.kind_of?(Net::HTTPClientError) or response.kind_of?(Net::HTTPServerError) )
          raise ContentRequestFailed, "#{response.code}:#{response.message}"
        end

        if content && response['content-disposition'].include?('filename=')
          process_file_response(response)
        else
          response.body
        end

      end

      # ##
      # Need to find a cleanup method for these tmp files
      def process_file_response(response)
        # content-type => application/pdf
        # content-disposition => inline; filename="Commission-WestBranch-0040.pdf"
        # x-request-id => f599bc98-4f8b-4e32-b296-9c8307ff4eaf
        real_filename = response['content-disposition'].scan(/filename=\"(.+)\"/).flatten.first
        tmp_filename = './tmp/content/' + response['x-request-id'] + '.' + (real_filename.split('.').last || response['content-type'].split('/').last)
        IO.binwrite(tmp_filename, response.body)
        {
            success: true,
            message: "Source Duration: #{response['x-runtime']} seconds",
            content_type: response['content-type'],
            request_id: response['x-request-id'],
            filename: real_filename,
            content_disposition: response['content-disposition'],
            payload: tmp_filename
        }
      end

    end # end class

  end
end

