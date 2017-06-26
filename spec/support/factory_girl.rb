require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "myuser#{n}name"}
    sequence(:email) {|n| "user#{n}@example.com" }
    first_name 'Carol'
    last_name 'Danvers'
    password 'password'
    password_confirmation 'password'
  end
#
#   factory :venue do
#     sequence(:name) { |n| "venue#{n}" }
#     location '123 5th Street'
#     website 'http://www.utphilly.com/'
#     photo 'uniontransfer.jpg'
#   end
#
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
