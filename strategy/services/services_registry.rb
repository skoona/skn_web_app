# ##
# File: ./strategy/services/services_registry.rb
# ##

# ##
# Manages Service initiation and dependencies
# - To be called from Roda Route Files
# - See html.helpers for invocation
# ##
module Services
  class ServicesRegistry

    attr_reader :ctx, :req

    def initialize(args={})
      @ctx = args.fetch(:roda_context, nil)
      @req = @ctx.request
      raise ArgumentError, "No Routing Context provided during initialization!" if @ctx.nil?
    end

    # Get Remote File Catalog
    def resources
      Content::CommandHandler.call(
          Content::Commands::RetrieveAvailableResources.new(username: ctx.current_user.username)
      )
    end

    # Get Remote Files
    def get_content_object
      Content::CommandHandler.call(
          Content::Commands::RetrieveResourceContent.new(
              { id: req.params['id'],
               username: ctx.current_user.username,
               content_type: req.params['content_type'] }
          )
      )
    end

  end # end class
end # end module
