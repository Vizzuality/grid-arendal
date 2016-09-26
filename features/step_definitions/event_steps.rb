# frozen_string_literal: true
Then /^I should have zero events$/ do
  expect(Event.all.size).to eq(0)
end

Then /^I should have one event$/ do
  expect(Event.all.size).to eq(1)
end

Then /^I should have two events$/ do
  expect(Event.all.size).to eq(2)
end

Given /^event$/ do
  FactoryGirl.create(:event)
end

Given /^partner event$/ do
  FactoryGirl.create(:partner_event)
end
