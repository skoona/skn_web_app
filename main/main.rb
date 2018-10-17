# File: ./main/main.rb

# ##
# Each Directory has a same named file that handles it's includes
# ##

require_relative 'utils/utils'
require_relative 'persistence/persistence'
require_relative 'authentication/authentication'
require_relative 'services/services'

# ##
# Configure our command processors
SknApp.registry
  .register(:catalog_provider, ->(command) { Services::Providers::Catalog.call(command) }, call: false)
  .register(:content_provider, ->(command) { Services::Providers::Content.call(command) }, call: false)
  .register(:file_handler, ->(response) { Services::Handlers::File.call(response) }, call: false)
  .register(:get_handler, ->(uri) { Services::Handlers::GetRequest.call(uri) }, call: false)
