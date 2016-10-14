# frozen_string_literal: true
FactoryGirl.define do
  factory :vacancy do
    title "Researcher"
    description "Looking for a smart researcher"
    is_published false
  end
end
