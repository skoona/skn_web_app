# File: ./strategy/services/content.rb

# ##
#  Local Exceptions
# ##

# Represents Rest request failure of an
class MetaDataRequestFailed < StandardError
end
class ContentRequestFailed < StandardError
end
class CommandFailedValidation < StandardError
end

# Each Directory has a same named file that handles it's includes
# ##

require_relative 'models/resources'
require_relative 'models/content'
require_relative 'models/failure'

require_relative 'commands/retrieve_resource_content'
require_relative 'commands/retrieve_available_resources'

require_relative 'command_handler'
