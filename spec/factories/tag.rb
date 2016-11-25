# frozen_string_literal: true
FactoryGirl.define do
  factory :tag do
    name       'tag one'
    category Tag::CATEGORIES.first
  end
end
