require 'rubygems'
require 'sinatra'

root_dir = File.dirname(__FILE__)

set :environment, ENV['RACK_ENV'].to_sym
set :root,        root_dir
# TODO why isn't set :app_file working correctly?
# set :app_file,    File.join(root_dir, 'app.rb')
require 'app'
disable :run

run Sinatra::Application