#!/usr/bin/env ruby
#
# File: ./config.ru

require 'puma'
require_relative "config/boot_web"

app = case ENV['RACK_ENV']
        when 'development', 'test'
          SknWeb.app
        else
          SknWeb.freeze.app
      end

run app
