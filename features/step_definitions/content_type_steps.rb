# frozen_string_literal: true
Then /^I should have zero content types$/ do
  expect(ContentType.all.size).to eq(0)
end

Then /^I should have one content type$/ do
  expect(ContentType.all.size).to eq(1)
end

Then /^I should have two content types$/ do
  expect(ContentType.all.size).to eq(2)
end

Given /^content type$/ do
  FactoryGirl.create(:content_type)
end
