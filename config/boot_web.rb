# ##
# File: ./config/boot_web.rb
# - Instantiate Web Interface Entry: SknWeb
#

# Load Main Application
require_relative 'boot'

# Web Interface
begin

  # Load Web Interface
  require './web/web'

rescue Bundler::BundlerError, StandardError => ex
  $stderr.puts ex.message
  if ex.is_a?(Bundler::BundlerError)
    $stderr.puts "Run `bundle install` to install missing gems"
    exit ex.status_code
  else
    $stderr.puts ex.backtrace[0..8]
    exit 1
  end
end
