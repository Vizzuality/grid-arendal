# frozen_string_literal: true
FactoryGirl.define do
  factory :news_article do
    title "About the Company"
    exposure_slug "my-news-article"
    publication_date 1.day.ago
  end
end
