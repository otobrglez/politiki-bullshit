$LOAD_PATH << "../"

ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'rack/test'
require './app'
