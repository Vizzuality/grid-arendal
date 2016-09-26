# frozen_string_literal: true
Then /^I should have zero activities$/ do
  expect(Activity.all.size).to eq(0)
end

Then /^I should have one activity$/ do
  expect(Activity.all.size).to eq(1)
end

Given /^activity$/ do
  FactoryGirl.create(:activity, title: 'My activity')
end
