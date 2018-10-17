# ##
# File: ./main/services/commands/retrieve_resource_content.rb
#
# cmd = Services::Content::Commands::RetrieveResourceContent.new(id: '1:0:0', username: 'developer', content_type: 'Commission')
# ##

module Services
  module Commands

    class RetrieveResourceContent
      attr_reader :username, :id, :content_type

      # #ID#;username=#USERNAME#;content_type=#CONTENT_TYPE#;
      def initialize(args={})
        # ## Required
        @id = args.fetch(:id, nil)
        @username = args.fetch(:username, nil)
        @content_type = args.fetch(:content_type, nil)
        # '/profiles/api_get_demo_content_object'
        host = SknSettings.content_service.url
        api_path = SknSettings.content_service.content_path.gsub(/(#ID#|#USERNAME#|#CONTENT_TYPE#)/,
                                                                 {
                                                                  '#ID#' => @id,
                                                                  '#USERNAME#' => @username,
                                                                  '#CONTENT_TYPE#' => @content_type
                                                                 })
        @_url = URI.parse("#{host}#{api_path}")
      end

      def uri
        raise CommandFailedValidation, "Command: #{self.class.name}, is not valid!" unless valid?
        @_url
      end

      def valid?
        [id, username, content_type].compact.size == 3
      end

      def storage_key
        "#{self.class.name}.#{username}"
      end

    end

  end
end
