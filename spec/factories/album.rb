# frozen_string_literal: true
FactoryGirl.define do
  factory :album do
    photoset_url Faker::Internet.url('example.com', '/album/first-album')
    photoset_id  '1111-2222-3333-4444'
  end
end
