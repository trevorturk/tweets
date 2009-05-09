# NOTE run by cd-ing into the root dir, then "ruby app.rb" - then http://localhost:4567

require 'rubygems'
require 'sinatra'
require 'sequel'

get '/' do
  @users = User.all
  @tweets = Tweet.all # TODO should only show tweets from people current_user (TODO) is following (TODO)
  erb :home
end

get '/:user' do
  @tweets = Tweet.filter(:user => params[:user])
  erb :user
end

configure do
  
  DB = Sequel.sqlite

  DB.create_table :users do
    primary_key :id
    String :login
  end

  class User < Sequel::Model
  end

  DB.create_table :tweets do
    primary_key :id
    String :user
    String :body
  end
  
  class Tweet < Sequel::Model
  end
  
  User.create(:login => 'geoff')
  User.create(:login => 'scott')
  User.create(:login => 'trevor')
  User.create(:login => 'zach')
  
  Tweet.create(:user => 'geoff', :body => "i'm hungry")
  Tweet.create(:user => 'scott', :body => "it's too cold in the office")
  Tweet.create(:user => 'trevor', :body => "let's talk about poop")
  Tweet.create(:user => 'zach', :body => "couchdb is the coolest!")
  
end
