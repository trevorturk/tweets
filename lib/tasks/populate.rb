namespace :db do
  task :populate => :environment do
    
    puts 'Creating Users...'
    User.create(:login => 'geoff')
    User.create(:login => 'scott')
    User.create(:login => 'trevor')
    User.create(:login => 'zach')
    
    puts 'Creating Tweets...'
    Tweet.create(:user => 'geoff', :body => "i'm hungry... again...")
    Tweet.create(:user => 'scott', :body => "it's too cold in the office :(")
    Tweet.create(:user => 'trevor', :body => "let's drink some whiskey?")
    Tweet.create(:user => 'zach', :body => "couchdb rulez!")
    
  end
end