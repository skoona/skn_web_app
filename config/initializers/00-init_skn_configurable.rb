# ##
# 00-init_configurable
#
# Main Business Application

class SknApp
  # define SknApp.config values
  include ::SknUtils::Configurable.with(:rom, :registry, enable_root: true)

  # Enable SknApp.env, SknApp.root, and SknApp.logger
  self.env    = ::SknUtils::EnvStringHandler.new( ENV.fetch('RACK_ENV', 'development') )
  self.root   = ::SknUtils::EnvStringHandler.new( Dir.pwd )

  configure do
    registry SknRegistry.new
  end

end
