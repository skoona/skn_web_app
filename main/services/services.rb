# File: ./strategy/services/services.rb

# ##
#  Local Exceptions
# ##

class CommandFailedValidation < StandardError
end

# ##
# Configure our command processors
SknApp.registry
    .register("catalog_provider", ->(command) { Services::Providers::Catalog.call(command) }, call: false)
    .register("content_provider", ->(command) { Services::Providers::Content.call(command) }, call: false)
    .register("file_response_handler", ->(response) { Services::Handlers::File.call(response) }, call: false)
    .register("get_request_handler", ->(uri) { Services::Handlers::GetRequest.call(uri) }, call: false)

# ##
# Each Directory has a same named file that handles it's includes
# ##

require_relative 'commands/commands'
require_relative 'handlers/handlers'
require_relative 'providers/providers'
require_relative 'services_registry'
