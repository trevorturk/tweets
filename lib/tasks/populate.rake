namespace :db do
  task :populate => :environment do
    
    puts 'Loading database schema...'
    Rake::Task['db:schema:load'].invoke
    
    puts 'Creating Users...'
    User.create(:login => 'geoff')
    User.create(:login => 'scott')
    User.create(:login => 'trevor')
    User.create(:login => 'zach')

    puts 'Creating Tweets...'
    Tweet.create(:body => "i'm hungry... again...") {|r| r.user = User.find_by_login('geoff')}
    Tweet.create(:body => "it's too cold in the office :(") {|r| r.user = User.find_by_login('scott')}
    Tweet.create(:body => "let's drink some whiskey?") {|r| r.user = User.find_by_login('trevor')}
    Tweet.create(:body => "couchdb rulez!") {|r| r.user = User.find_by_login('zach')}

  end
end