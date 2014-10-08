require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'sinatra/contrib'
require './bullshit'

configure :development do
  require "sinatra/reloader"
end
