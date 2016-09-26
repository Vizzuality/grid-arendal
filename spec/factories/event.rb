# frozen_string_literal: true
FactoryGirl.define do
  factory :event do
    title       'Event one'
    web_url     Faker::Internet.url('example.com', '/foobar')
    description Faker::Lorem.paragraph
  end

  factory :partner_event, class: Event do
    title       'Partner event'
    web_url     Faker::Internet.url('example.com', '/foobar')
    description Faker::Lorem.paragraph
    active      true
    after(:create) do |partner_event|
      FactoryGirl.create(:partner, events: [partner_event])
    end
  end
end
