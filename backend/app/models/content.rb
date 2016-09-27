# frozen_string_literal: true
# == Schema Information
#
# Table name: contents
#
#  id            :integer          not null, primary key
#  type          :string
#  title         :string
#  description   :text
#  is_published  :boolean
#  position      :integer
#  story_map_url :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Content < ApplicationRecord
  include Publishable

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  has_many :participants
  has_many :users, through: :participants

  has_many :content_partners
  has_many :partners, through: :content_partners

  validates :title, presence: true
end
