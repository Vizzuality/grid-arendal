# frozen_string_literal: true
FactoryGirl.define do
  factory :photo do
    photo_url Faker::Internet.url('example.com', '/photo/first-photo')
    photo_id  '2222-2222-3333-4444'
  end
end
