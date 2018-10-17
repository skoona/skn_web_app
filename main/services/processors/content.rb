# ##
# File: ./main/services/proccessors/content.rb
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
  module Processors

    class Content
      include ::Authentication::CacheProvider

      def self.call(command, options={})
        self.new(options).call(command)
      end

      def call(cmd)
        resp = @commands.key?(cmd.class) && cmd.valid? ? @commands[cmd.class].call(cmd) : SknFailure.call( self.class.name, "[#{cmd.class.name}] #{@description}: Unknown Request type" )
        duration = "%3.1f seconds" % (Process.clock_gettime(Process::CLOCK_MONOTONIC) - @_start_time)
        logger.info "#{self.class.name}##{__method__} Command: #{cmd.class.name.split('::').last}, Returned: #{resp.class.name.split('::').last}, Duration: #{duration}"
        resp
      rescue StandardError => e
        duration = "%3.1f seconds" % (Process.clock_gettime(Process::CLOCK_MONOTONIC) - @_start_time)
        logger.warn "#{self.class.name}##{__method__} Failure Request: Provider: #{@description}, klass=#{e.class.name}, cause=#{e.message}, Duration: #{duration}, Backtrace=#{e.backtrace[0..1]}"
        SknFailure.call(self.class.name, "#{e.class.name}::#{e.message}, Duration: #{duration}")
      end

    private

      def initialize(options={})
        @_do_request   = options.fetch(:get_request_handler, Services::Content::Handlers::GetRequest)
        @_start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        @description   = SknSettings.content_service.description
        @commands = {
            Services::Content::Commands::RetrieveAvailableResources  => method(:resources_metadata),
            Services::Content::Commands::RetrieveResourceContent  => method(:resource_content)
        }
      end

      # SknSuccess or SknFailure
      def resources_metadata(cmd)
        # :username is only param
        resp = fetch_object(cmd.storage_key)
        if resp.nil?
          res = @_do_request.call(cmd.uri)
          resp = res.success ? SknSuccess.call(JSON.parse(res.value).dig('package','payload')) : res
          cache_object(cmd.storage_key, resp) if resp.success
        end
        resp
      rescue StandardError => e
        logger.warn "#{self.class.name}##{__method__} Failure Request: Provider: #{@description}, klass=#{e.class.name}, cause=#{e.message}, Backtrace=#{e.backtrace[0..1]}"
        SknFailure.call(self.class.name, "[Metadata] #{e.class.name}:#{e.message}| #{@description}")
      end

      # SknSuccess or SknFailure
      def resource_content(cmd)
        resp = @_do_request.call(cmd.uri)
        if resp.success
          logger.info "#{__method__}: Returns => #{resp.payload.filename} as: #{resp.payload.content_type}, with #{resp.message}"
        else
          logger.info "#{__method__}: Failed => #{resp.value} with #{resp.class.name} #{resp.message}"
        end
        resp
      rescue StandardError => e
        logger.warn "#{self.class.name}##{__method__} Failure Request: Provider: #{@description}, klass=#{e.class.name}, cause=#{e.message}, Backtrace=#{e.backtrace[0..1]}"
        SknFailure.call(self.class.name, "[Content] #{e.class.name}:#{e.message}| #{@description}")
      end

      def logger
        Logging.logger['HLR']
      end

    end # end class

  end
end

