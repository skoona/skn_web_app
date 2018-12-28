# ##
# File: ./main/services/commands/retrieve_user_detail.rb
#
#
# cmd = Services::Commands::RetrieveUserDetail.new(pak: person_authentication_key)
# ##

module Services
  module Commands

    class RetrieveUserDetail

      def initialize(args={})
        # ## Required
        @_pak = args.fetch(:pak, nil)
      end

      def uri
        raise NotImplementedError, "#{self.class.name}##{__method__} Not Required"
      end

      def valid?
        self.instance_variable_defined?(:@_pak) && !!@_pak
      end

      def storage_key
        "#{self.class.name}.#{pak}"
      end

      def payload
        @_pak
      end

    end

  end
end
