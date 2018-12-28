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
gem 'sass' # 'sassc'
gem 'tilt-pipeline'

# Javascript Runtime Support
gem 'execjs'
gem "therubyracer"
# gem 'therubyrhino', platform: :jruby
gem 'uglifier'

# Core Components
gem 'skn_utils'
gem 'dry-types'
gem 'dry-monads'
gem 'dry-struct'
gem 'dry-container'
gem 'dry-configurable'
# gem 'dry-validation'


# General Utilities
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
  gem "racksh"
  gem "rubrowser", require: false
end

group :development, :test do
  gem 'pry'
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
  gem 'webmock'
end
