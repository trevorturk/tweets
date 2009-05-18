require 'populator'
require 'faker'

Sham.login { "#{Faker::Name.first_name}_#{Faker::Name.last_name}".gsub(/'/, '')[0,15].downcase }
Sham.sentence { Faker::Lorem.sentence }

Tweet.blueprint do
  user
  body { Sham.sentence }
end

User.blueprint do
  login { Sham.login }
end
