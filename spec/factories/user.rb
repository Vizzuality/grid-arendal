# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  organization           :string
#  current_position       :string
#  web_url                :string
#  active                 :boolean          default(FALSE), not null
#  deactivated_at         :datetime
#  role                   :integer          default("member"), not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "martin#{n}@vizzuality.com" }

    password 'password'
    password_confirmation { |u| u.password }
    first_name Faker::Name.first_name
    last_name  Faker::Name.last_name
    organization Faker::Company.name
    web_url Faker::Internet.url('example.com', '/foobar')
    current_position Faker::Company.profession
  end

  factory :publisheruser, class: User do
    sequence(:email) { |n| "publisher#{n}@vizzuality.com" }

    password 'password'
    password_confirmation { |u| u.password }
    first_name Faker::Name.first_name
    last_name  Faker::Name.last_name
    organization Faker::Company.name
    web_url Faker::Internet.url('example.com', '/foobar')
    current_position Faker::Company.profession
    active true
    role 'publisher'
  end

  factory :adminuser, class: User do
    sequence(:email) { |n| "admin#{n}@vizzuality.com" }

    password 'password'
    password_confirmation { |u| u.password }
    first_name Faker::Name.first_name
    last_name  Faker::Name.last_name
    organization Faker::Company.name
    web_url Faker::Internet.url('example.com', '/foobar')
    current_position Faker::Company.profession
    active true
    role 'admin'
  end
end
