# frozen_string_literal: true
Then /^I should have zero news_articles$/ do
  expect(NewsArticle.all.size).to eq(0)
end

Then /^I should have one news_article$/ do
  expect(NewsArticle.all.size).to eq(1)
end

Given /^news_article$/ do
  FactoryGirl.create(:news_article, title: 'About the Company')
end
