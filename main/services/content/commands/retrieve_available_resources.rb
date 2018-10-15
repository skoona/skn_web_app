# ##
# File: ./strategy/services/content/commands/retrieve_available_resources.rb
#
#
# cmd = Services::Content::Commands::RetrieveAvailableResources.new(username: 'emtester')
# ##

module Services
  module Content
    module Commands

      class RetrieveAvailableResources

        attr_reader :username

        def initialize(args={})
          # ## Required
          @username = args.fetch(:username, nil)
          # '/profiles/api_in_action'
          host = SknSettings.content_service.url
          api_path = SknSettings.content_service.resources_path.gsub(/#USERNAME#/, @username)
          @_url = URI.parse("#{host}#{api_path}")
        end

        def uri
          raise CommandFailedValidation, "Command: #{self.class.name}, is not valid!" unless valid?
          @_url
        end

        def valid?
          self.instance_variable_defined?(:@username) && !@username.nil?
        end

        def model
          'Services::Content::Models::Resources'
        end

        def storage_key
          "#{self.class.name}.#{username}"
        end

      end

    end
  end
end
