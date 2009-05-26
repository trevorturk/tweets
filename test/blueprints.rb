require 'populator'
require 'faker'

Sham.login { "#{Faker::Name.first_name}_#{Faker::Name.last_name}".gsub(/'/, '')[0,15].downcase }
Sham.sentence { Faker::Lorem.sentence }

Follow.blueprint do
  follower_id { User.make.id }
  following_id { User.make.id }
end

Tweet.blueprint do
  user
  body { Sham.sentence }
end

User.blueprint do
  login { Sham.login }
end

Sham.tweet { Tweet.make }

FeedItem.blueprint do
  user
  tweet_id { Sham.tweet.id }
  tweet_user_id { Sham.tweet.user_id }
  tweet_created_at { Sham.tweet.created_at }
end
