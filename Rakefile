#!/usr/bin/env rake
#
# Ref: https://michaelrigart.be/rake-basics/
#      https://ruby.github.io/rake/
#

require_relative 'config/environment' # Setup LoadPath for gems listed in the Gemfile.

require 'rspec/core/rake_task'
require 'rom/sql/rake_task'


# Reset some known tasks
task(:default).clear
task(:test).clear
task(:environment).clear

# desc "Instantiates Application Environment."
task :environment  do
  require_relative 'config/boot_web'
end

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

# Set default and test to spec --prerequisites
RSpec::Core::RakeTask.new(:spec)

desc "Run all rspec tests. "
task :default => :spec
task :test => :spec
