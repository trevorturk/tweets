# NOTE run by cd-ing into the root dir, then "ruby app.rb" - then http://localhost:4567

require 'rubygems'
require 'sinatra'

get '/' do
  erb :home
end

get '/:user' do
  erb :user
end
