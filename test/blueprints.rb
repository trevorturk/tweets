require 'populator'
require 'faker'

Sham.login { "#{Faker::Name.first_name}_#{Faker::Name.last_name}".gsub(/'/, '')[0,15].downcase }
Sham.sentence { Faker::Lorem.sentence }

# FeedItem.blueprint do
#   user
#   tweet_id { Tweet.make.id }
#   tweet_user_id { Tweet.user.id }
#   tweet_created_at { Tweet.created_at }
# end

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
