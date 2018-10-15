# File: ./main/main.rb

# ##
# Each Directory has a same named file that handles it's includes
# ##

# Load Database Services
require_relative 'persistence/persistence'

require_relative 'utils/utils'
require_relative 'authentication/authentication'
require_relative 'services/services'
