if $LOADED_FEATURES.grep(/spec\/spec_helper\.rb/).any?
  begin
    raise "foo"
  rescue => e
    puts <<-MSG
  ===================================================
  It looks like spec_helper.rb has been loaded
  multiple times. Normalize the require to:

    require "spec/spec_helper"

  Things like File.join and File.expand_path will
  cause it to be loaded multiple times.

  Loaded this time from:

    #{e.backtrace.join("\n    ")}
  ===================================================
    MSG
  end
end

ENV['RACK_ENV'] = 'test'

RSpec::Expectations.configuration.warn_about_potential_false_positives = true

require 'simplecov'
require 'code_coverage'

require './config/boot_web'  # main application with web

require 'rspec'
require 'rspec-roda'
require 'rack/test'

require 'webmock/rspec'

require 'capybara'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara-screenshot/rspec'
require 'rack_session_access/capybara'

require 'dry/container/stub'

require 'support/test_users'
require 'support/utilities'
require 'support/test_data_serializers'
require 'support/capybara'
require 'support/feature_helpers'
require 'factories/resource_data'


RSpec.configure do |config|
  Kernel.srand config.seed

  config.order = :random
  config.color = true
  config.tty = false
  config.profile_examples = 10

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # config.disable_monkey_patching!  # -- breaks rspec runtime
  config.warnings = false

  if config.files_to_run.one?
    config.formatter = :documentation
  else
    config.formatter = :progress  #:html, :textmate, :documentation
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Rack::Test::Methods
  config.include TestUsers
  config.include TestDataSerializers
  config.include Utilities
  config.include FeatureHelpers, type: :feature       # logged_as(user) session injection for cucumber/capybara

  config.include ResourceData
  config.include WebMock::API

  config.before(:each) do
    Capybara.use_default_driver       # switch back to default driver
  end

  config.append_after(:each) do
    ::Authentication::ObjectStorageContainer.instance.reset_cache!
    Capybara.reset_sessions!
  end
end

# ##
# Discover Warden in App Chain
# ##
# x = Skn::SknWebApp.app
# x = x.instance_variable_get :@app while x.class.name != 'Warden::Manager'
#

# Dir[ "./spec/support/**/*.rb" ].each { |f| puts f ; require f }
