# NOTE run by cd-ing into the root dir, then "ruby app.rb" - then http://localhost:4567

require 'rubygems'
require 'sinatra'
require 'sequel'

# ACTIONS

get '/' do
  @users = User.all
  erb :home
end

get '/:user' do
  erb :user
end

# DATABASE

DB = Sequel.sqlite

DB.create_table :users do
  primary_key :id
  String :login
end

class User < Sequel::Model
end

# BOOTSTRAP

configure do
  User.insert(:login => 'geoff')
  User.insert(:login => 'scott')
  User.insert(:login => 'trevor')
  User.insert(:login => 'zach')
end
