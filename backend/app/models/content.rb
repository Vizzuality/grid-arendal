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
  include Sanitizable
  include Featurable
  include Attachable::Picture

  acts_as_taggable

  has_many :participants
  has_many :users, through: :participants

  has_many :content_partners
  has_many :partners, through: :content_partners
  belongs_to :content_type
  belongs_to :media_content

  has_many :tags, through: :taggings

  validates :title, presence: true
end
