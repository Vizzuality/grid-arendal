# frozen_string_literal: true
Then /^I should have zero media contents$/ do
  expect(MediaContent.all.size).to eq(0)
end

Then /^I should have one media content$/ do
  expect(MediaContent.all.size).to eq(1)
end

Then /^I should have two media contents with attach$/ do
  expect(MediaContent.all.size).to eq(2)
end

Then /^I should have many media contents$/ do
  expect(MediaContent.all.size).to be >= 2
end

Given /^photo content$/ do
  FactoryGirl.create(:photo_content, title: 'My photo')
end

Given /^album content$/ do
  FactoryGirl.create(:album_content, title: 'My album')
end
