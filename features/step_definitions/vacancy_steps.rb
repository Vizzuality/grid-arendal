# frozen_string_literal: true
Then /^I should have zero vacancies$/ do
  expect(Vacancy.all.size).to eq(0)
end

Then /^I should have one vacancy$/ do
  expect(Vacancy.all.size).to eq(1)
end

Given /^vacancy$/ do
  FactoryGirl.create(:vacancy, title: 'Researcher')
end
