# ##
# File: ./main/services/services_registry.rb
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
      command =
          Commands::RetrieveAvailableResources.new(username: ctx.current_user.username)
      SknApp.registry.resolve("catalog_provider").call( command )
    end

    # Get Remote Files
    def content
      command =
          Commands::RetrieveResourceContent.new({id: req.params['id'],
                                                 username: ctx.current_user.username,
                                                 content_type: req.params['content_type'] })
      SknApp.registry.resolve("content_provider").call( command )
    end

    # Get Remote Files
    def user_detail
      command =
          Commands::RetrieveUserDetail.new({pak: ctx.current_user.person_authentication_key})

      SknApp.registry.resolve("user_detail_provider").call( command )
    end

  end # end class
end # end module
