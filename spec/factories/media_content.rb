# frozen_string_literal: true
FactoryGirl.define do
  factory :album_content, class: 'MediaContent' do
    title        'First album'
    description  Faker::Lorem.paragraph
    is_published true

    after(:create) do |album|
      FactoryGirl.create(:album, media_content: album)
    end
  end

  factory :photo_content, class: 'MediaContent' do
    title        'First photo'
    description  Faker::Lorem.paragraph
    is_published true

    after(:create) do |photo|
      FactoryGirl.create(:photo, media_content: photo)
    end
  end

  factory :media_content_blank, class: 'MediaContent' do
    title        'MediaContent blank'
    description  Faker::Lorem.paragraph
    is_published true
  end
end
