# ##
# 00-init_configurable
#
# Main Business Application

class SknApp
  # define SknApp.config values
  extend Dry::Configurable

  # Enable SknApp.env, SknApp.root, and SknApp.logger
  setting(:rom)
  setting(:env, ::SknUtils::EnvStringHandler.new( ENV.fetch('RACK_ENV', 'development')), reader: true)
  setting(:root, ::SknUtils::EnvStringHandler.new( Dir.pwd ), reader: true)
  setting(:registry, ::Dry::Container.new, reader: true)
  setting(:logger, "", reader: true, writer: true)

end
