# ##
# ./Gemfile

source "https://rubygems.org"

gem 'logging'

# Web framework: Core
gem "puma"
gem "roda"

# Web framework: Html
gem "tilt"
gem "erubis"
gem 'forme'
gem 'roda-tags'
gem 'sass'
# gem 'bootstrap-sass'
# gem 'semantic-ui-sass'
# gem 'sprockets-sass'
# gem 'roda-sprocket_assets'
gem 'tilt-pipeline'
# gem 'tilt-indirect'
#

# Javascript Runtime Support
gem 'execjs'
gem "therubyracer", platform: [:mri, :ruby]
gem 'therubyrhino', platform: :jruby
gem 'uglifier'

# Core Components
gem 'dry-types'
gem 'dry-monads'
# gem 'dry-struct'
# gem 'dry-container'
# gem 'dry-auto_inject'


# General Utilities
gem 'skn_utils'
gem 'concurrent-ruby', require: 'concurrent'
gem 'time_math2', require: 'time_math'
gem 'mime-types'
gem 'rake'
gem "r18n-core"
gem "roda-i18n"

# Persistence
gem 'pg'
gem 'rom'
gem 'rom-sql'

# Web Security
gem 'rack-contrib'
gem "rack-protection"
gem "rack_csrf"
gem "bcrypt"
gem 'warden'

group :development do
  gem 'pry'
  gem "racksh"
  gem "rubrowser", require: false
end

group :test do
  gem 'rspec'
  gem 'faker'
  gem 'rack-test'
  gem 'rspec-roda'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'rack_session_access'
  gem 'simplecov', :require => false
  gem "rom-factory"
  gem 'poltergeist'
end
