# frozen_string_literal: true
Then /^I should have zero tags$/ do
  expect(Tag.all.size).to eq(0)
end

Then /^I should have one tag$/ do
  expect(Tag.all.size).to eq(1)
end

Then /^I should have two tags$/ do
  expect(Tag.all.size).to eq(2)
end

Given /^tag$/ do
  FactoryGirl.create(:tag)
end
