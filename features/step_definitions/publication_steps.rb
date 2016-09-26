# frozen_string_literal: true
Then /^I should have zero publications$/ do
  expect(Publication.all.size).to eq(0)
end

Then /^I should have one publication$/ do
  expect(Publication.all.size).to eq(1)
end

Given /^publication$/ do
  FactoryGirl.create(:publication, title: 'My publication')
end
