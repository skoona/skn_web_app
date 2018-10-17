# ##
# File: ./config/boot.rb
# - Initialize Core Application: SknApp
#

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)


# Instantiate Application
begin
  require 'bundler/setup' # Setup LoadPath for gems listed in the Gemfile.
  require_relative 'version'              # Skn::Version

  Bundler.require(:default, ENV['RACK_ENV'].to_sym) # Require all the gems for this environment

  # Ruby Standard Library Modules
  require "psych"
  require 'json'
  require 'erb'
  require 'pathname'
  require "securerandom"
  require "net/http"
  require "uri"
  require 'mime/types'


  Dir["./config/initializers/**/*.rb"].sort.each do |pgm_resource|
    begin
      require pgm_resource
    rescue LoadError => e
      puts "[Boot] Ignoring Exception for: #{e.class} #{e.message}"
    end
  end

  flist =  Dir['./tmp/content/*'] # remove prior downloads
  unless flist.empty?
    fcount = File.delete(*flist)
    puts "TMP Folder Cleaner: Unlinked # #{fcount} files."
  end

  # Load Main Business App
  require_relative '../main/main'

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

