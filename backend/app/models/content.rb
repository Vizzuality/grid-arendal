# frozen_string_literal: true
# == Schema Information
#
# Table name: contents
#
#  id                   :integer          not null, primary key
#  type                 :string
#  title                :string
#  description          :text
#  is_published         :boolean
#  position             :integer
#  story_map_url        :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class Content < ApplicationRecord
  include Publishable
  include Attachable::Picture

  has_many :participants
  has_many :users, through: :participants

  has_many :content_partners
  has_many :partners, through: :content_partners

  validates :title, presence: true
end
