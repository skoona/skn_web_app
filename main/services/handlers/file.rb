# ##
#
# Handle Temporary File Response
# Services::Handlers::File

module Services
  module Handlers

    class File
      def self.call(response, options={})
        new(options).call(response)
      end

      def initialize(options={})
        @_temp_path = options.fetch(:temp_path, './tmp/content/')
      end

      def call(response)
        # content-type => application/pdf
        # content-disposition => inline; filename="Commission-WestBranch-0040.pdf"
        # x-request-id => f599bc98-4f8b-4e32-b296-9c8307ff4eaf
        real, temp = filenames(response)
        IO.binwrite(temp, response.body)
        SknSuccess.call({
            content_type: response['content-type'],
            request_id: response['x-request-id'],
            filename: real,
            content_disposition: response['content-disposition'],
            payload: temp },
            "Source Duration: #{response['x-runtime']} seconds")
      end

      def filenames(rsp)
        real = rsp['content-disposition'].scan(/filename=\"(.+)\"/).flatten.first
        temp = "#{@_temp_path}#{rsp['x-request-id']}.#{real.split('.').last || rsp['content-type'].split('/').last}"
        [real, temp]
      end

    end # end class
  end
end
