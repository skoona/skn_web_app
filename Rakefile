#!/usr/bin/env rake
#
# Ref: https://michaelrigart.be/rake-basics/
#      https://ruby.github.io/rake/
#

require_relative 'config/environment' # Setup LoadPath for gems listed in the Gemfile.

require 'rspec/core/rake_task'
require 'rom/sql/rake_task'

# ##
# require existing tasks
# - Could use ./rakelib/*.rake vs ./lib/tasks/*.rake
# - Rake.add_rakelib 'lib/tasks' -- or anything else
#
Dir["rakelib/**/*.rake"].each do |task_resource|
  begin
    import task_resource
  rescue LoadError => e
    puts "[RakeLib] Ignoring Exception for: #{e.class} #{e.message} #{e.backtrace}"
  end
end

# Reset some known tasks
task(:default).clear
task(:test).clear
task(:environment).clear

# desc "Instantiates Application Environment."
task :environment  do
  require_relative 'config/boot_web'
end

# Set default and test to spec --prerequisites
RSpec::Core::RakeTask.new(:spec)

desc "Run all rspec tests. "
task :default => :spec
task :test => :spec

namespace :db do
  task :setup do
    # your ROM setup code
    # Usually something like this:
    # ROM::SQL::RakeSupport.env = ROM.container(...)
    # ROM::SQL::RakeSupport.env = SknApp.config.rom
    db_config = ROM::Configuration.new(:sql, SknSettings.postgresql.url, user: SknSettings.postgresql.user, password: SknSettings.postgresql.password)
    ROM::SQL::RakeSupport.env = ROM.container(db_config)
  end
end
