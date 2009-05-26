namespace :db do
  task :populate => :environment do
    
    puts 'Loading database schema...'
    Rake::Task['db:schema:load'].invoke
    
    puts 'Creating Users...'
    geoff = User.create(:login => 'geoff')
    scott = User.create(:login => 'scott')
    trevor = User.create(:login => 'trevor')
    zach = User.create(:login => 'zach')
    
    puts 'Creating Follows...'
    geoff.follow(scott)
    trevor.follow(geoff)
    trevor.follow(scott)
    trevor.follow(zach)
    
    puts 'Creating Tweets...'
    Tweet.create(:body => "i'm hungry... again...") {|r| r.user = User.find_by_login('geoff')}
    Tweet.create(:body => "it's too cold in the office :(") {|r| r.user = User.find_by_login('scott')}
    Tweet.create(:body => "let's drink some whiskey?") {|r| r.user = User.find_by_login('trevor')}
    Tweet.create(:body => "couchdb rulez!") {|r| r.user = User.find_by_login('zach')}
    
  end
end