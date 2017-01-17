# frozen_string_literal: true
FactoryGirl.define do
  factory :activity do
    title "My first activity"
    description "It's about life itself"
    is_published true
    is_featured true
    status "Completed"
  end
end
