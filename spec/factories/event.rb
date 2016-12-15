# frozen_string_literal: true
FactoryGirl.define do
  factory :event do
    title       'Event one'
    web_url     Faker::Internet.url('example.com', '/foobar')
    description Faker::Lorem.paragraph
  end

  factory :event_partner do
    association :event
    association :partner
  end

  factory :partner_event, class: Event do
    title       'Partner event'
    web_url     Faker::Internet.url('example.com', '/foobar')
    description Faker::Lorem.paragraph
    active      true
    after(:create) do |partner_event|
      FactoryGirl.create(:event_partner, event: partner_event)
    end
  end
end
