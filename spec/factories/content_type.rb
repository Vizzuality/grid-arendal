# frozen_string_literal: true
FactoryGirl.define do
  factory :content_type do
    title       'Content Type one'
    for_content ContentType::Activity
    description Faker::Lorem.paragraph
  end
end
