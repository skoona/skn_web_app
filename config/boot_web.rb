# ##
# File: ./config/boot_web.rb
# - Instantiate Web Interface Entry: SknWeb
#

# Load Main Application
require_relative 'boot'

# Load Path
begin

  ['web/routes', 'web/views', 'web'].each do |path_name|
    codes = File.expand_path("../#{path_name}", __dir__)
    $LOAD_PATH.unshift(codes) unless $LOAD_PATH.include?(codes)
  end
rescue StandardError => ex
  SknApp.logger.error ex.message
  SknApp.logger.error ex.backtrace[0..8]
  exit 1
end

# Web Interface
begin

  require 'warden'
  require_relative 'warden'

  require_relative "../web/skn_web"

# Named Routes and view helpers
  ['web/routes', 'web/helpers'].each do |web_mod|
    Dir["./#{web_mod}/**/*.rb"].each do |pgm_resource|
      begin
        require pgm_resource
      rescue LoadError => e
        puts "[Boot Web] Ignoring Exception for: #{e.class} #{e.message}"
      end
    end
  end

rescue StandardError => ex
  SknApp.logger.error ex.message
  SknApp.logger.error ex.backtrace[0..8]
  exit 1
end
