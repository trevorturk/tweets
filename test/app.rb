# NOTE run tests by cd-ing into root dir and running "ruby test/app.rb"

require 'app.rb'
require 'test/unit'
require 'sinatra/test'

class Tweets < Test::Unit::TestCase
  include Sinatra::Test

  def test_home
    assert_nothing_raised do
      get '/'
    end
  end

  def test_user
    assert_nothing_raised do
      get '/zach'
    end
  end

end