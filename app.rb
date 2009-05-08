# NOTE run by cd-ing into the root dir, then "ruby app.rb" - then http://localhost:4567

require 'rubygems'
require 'sinatra'
require 'sequel'

#
# DATABASE
#

DB = Sequel.sqlite

DB.create_table :users do
  primary_key :id
  String :login
end

DB[:users].insert(:login => 'geoff')
DB[:users].insert(:login => 'scott')
DB[:users].insert(:login => 'trevor')
DB[:users].insert(:login => 'zach')

#
# ACTIONS
#

get '/' do
  @users = DB[:users].all
  erb :home
end

get '/:user' do
  erb :user
end