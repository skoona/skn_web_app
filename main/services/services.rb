# File: ./strategy/services/services.rb

# ##
#  Local Exceptions
# ##

# ##
# Each Directory has a same named file that handles it's includes
# ##

# Represents Rest request failure of an
class CommandFailedValidation < StandardError
end

require_relative 'commands/commands'
require_relative 'handlers/handlers'
require_relative 'providers/providers'
require_relative 'services_registry'
