# ##
# File: ./main/services/providers/user_detail.rb
# ##


module Services
  module Providers

    class UserDetail

      def self.call(command, options={})
        self.new(options).call(command)
      end

      def initialize(options={})
        @_do_request   = options.fetch('user_detail_handler', SknApp.registry.resolve('user_detail_handler'))
        @_start_time   = SknUtils.duration
        @description   = SknSettings.content_service.description
      end

      # Services::Content::Commands::RetrieveUserDetail
      def call(cmd)
        resp = cmd.valid? ? process(cmd) : SknFailure.call( self.class.name, "[#{cmd.class.name}] #{@description}: Unknown Command type" )
        duration = SknUtils.duration(@_start_time)
        logger.info "#{self.class.name}##{__method__} Command: #{cmd.class.name.split('::').last}, Returned: #{resp.class.name.split('::').last}, Duration: #{duration}"
        resp
      rescue StandardError => e
        duration = SknUtils.duration(@_start_time)
        logger.warn "#{self.class.name}##{__method__} Failure Request: Provider: #{@description}, klass=#{e.class.name}, cause=#{e.message}, Duration: #{duration}, Backtrace=#{e.backtrace[0..4]}"
        SknFailure.call(self.class.name, "#{e.class.name}::#{e.message}, Duration: #{duration}")
      end

      # SknSuccess or SknFailure
      def process(cmd)
        resp = @_do_request.call(cmd.payload)
        if resp.success
          logger.info "#{self.class.name}##{__method__}: Returns => #{resp.payload.user.name}, with #{resp.message}"
        else
          logger.info "#{self.class.name}##{__method__}: Failed => #{resp.value} with #{resp.class.name} #{resp.message}"
        end

        resp
      end

      def logger
        Logging.logger['HLR']
      end

    end # end class

  end
end

