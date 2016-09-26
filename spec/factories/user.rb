# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "martin#{n}@vizzuality.com" }

    password 'password'
    password_confirmation { |u| u.password }
    first_name Faker::Name.first_name
    last_name  Faker::Name.last_name
    organization Faker::Company.name
    web_url Faker::Internet.url('example.com', '/foobar')
    current_position Faker::Company.profession
  end

  factory :publisheruser, class: User do
    sequence(:email) { |n| "publisher#{n}@vizzuality.com" }

    password 'password'
    password_confirmation { |u| u.password }
    first_name Faker::Name.first_name
    last_name  Faker::Name.last_name
    organization Faker::Company.name
    web_url Faker::Internet.url('example.com', '/foobar')
    current_position Faker::Company.profession
    active true
    role 'publisher'
  end

  factory :adminuser, class: User do
    sequence(:email) { |n| "admin#{n}@vizzuality.com" }

    password 'password'
    password_confirmation { |u| u.password }
    first_name Faker::Name.first_name
    last_name  Faker::Name.last_name
    organization Faker::Company.name
    web_url Faker::Internet.url('example.com', '/foobar')
    current_position Faker::Company.profession
    active true
    role 'admin'
  end
end
