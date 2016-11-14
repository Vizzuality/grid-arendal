# frozen_string_literal: true
Then /^I should have zero publications$/ do
  expect(Publication.all.size).to eq(0)
end

Then /^I should have one publication$/ do
  expect(Publication.all.size).to eq(1)
end

Then /^I should have one published publication$/ do
  expect(Publication.published.size).to eq(1)
end

Then /^I should have one unpublished publication$/ do
  expect(Publication.unpublished.size).to eq(1)
end

Then /^I should have one not_featured publication$/ do
  expect(Publication.not_featured.size).to eq(1)
end

Given /^publication$/ do
  FactoryGirl.create(:publication, title: 'My publication', is_published: true)
end
