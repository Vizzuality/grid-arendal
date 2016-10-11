# frozen_string_literal: true
# == Schema Information
#
# Table name: media_contents
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  is_published :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class MediaContent < ApplicationRecord
  include Publishable
  include Sanitizable
  include Mediable

  attr_accessor :photo_file, :main_photo_file

  validates :title, presence: true

  scope :includes_mediable, -> { includes([:photo, :album]) }
  scope :order_by_title,    -> { order('title ASC') }
end
