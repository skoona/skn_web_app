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

require_relative 'content/content'
require_relative 'processors/processors'
require_relative 'services_registry'
