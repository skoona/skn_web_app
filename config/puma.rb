#!/usr/bin/env puma

# config/puma.rb


# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum
#

threads_count = 5
threads 0, threads_count

directory '.'

rackup 'config.ru'
daemonize false

pidfile 'tmp/pids/puma.pid'
state_path 'tmp/pids/puma.state'

# Specifies the `port` that Puma will listen on to receive requests, default is 3000.
port        ENV.fetch("RACK_PORT") { 8585 }

# Specifies the `environment` that Puma will run in.
environment ENV.fetch("RACK_ENV") { "development" }

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
