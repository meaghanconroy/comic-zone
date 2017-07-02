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
    writer 'Ryan North'
    artist 'Erica Henderson'
    main_character 'Squirrel Girl'
    other_characters 'Koi Boy'
  end

  factory :subscription do
    user
    comic
  end
end
