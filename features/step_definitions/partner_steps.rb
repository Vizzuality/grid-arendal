# frozen_string_literal: true
Then /^I should have zero partners$/ do
  expect(Partner.all.size).to eq(0)
end

Then /^I should have one partner$/ do
  expect(Partner.all.size).to eq(1)
end

Given /^partner$/ do
  FactoryGirl.create(:partner, name: 'Partner one')
end
