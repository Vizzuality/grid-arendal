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

  attr_accessor :photo_file, :main_photo_file, :mediable

  has_many :album_photos_as_album, class_name: 'AlbumRelation', foreign_key: :photoset_id
  has_many :photosets_as_photo,    class_name: 'AlbumRelation', foreign_key: :album_photo_id

  has_many :album_photos, through: :album_photos_as_album
  has_many :photosets,    through: :photosets_as_photo

  accepts_nested_attributes_for :album_photos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :photosets,    reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true

  scope :includes_mediable, -> { includes([:photo, :album]) }
  scope :order_by_title,    -> { order('title ASC')         }
end
