require 'factory_girl'

FactoryGirl.define do
  factory :user do
    username 'captmarvel'
    sequence(:email) {|n| "user#{n}@example.com" }
    first_name 'Carol'
    last_name 'Danvers'
    password 'password'
    password_confirmation 'password'
  end

  factory :comic do
    publisher 'Marvel'
    title 'Unbeatable Squirrel Girl'
    creators ['Ryan North, writer']
    characters ['Squirrel Girl']
  end

#   factory :admin_user do
#     first_name 'admin'
#     last_name 'meg'
#     email 'friday@launch.com'
#     password 'password'
#     password_confirmation 'password'
#     admin true
#   end
#
#   factory :review do
#     rating 5
#     description "This venue is...."
#     user
#     venue
#   end
#
#   factory :vote do
#     user
#     review
#     value 1
#   end
end
