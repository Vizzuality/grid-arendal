# frozen_string_literal: true
Then /^I should have zero about_sections$/ do
  expect(AboutSection.all.size).to eq(0)
end

Then /^I should have one about_section$/ do
  expect(AboutSection.all.size).to eq(1)
end

Given /^about_section$/ do
  FactoryGirl.create(:about_section, title: 'About the Company')
end
