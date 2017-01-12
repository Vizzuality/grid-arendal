# == Schema Information
#
# Table name: media_contents
#
#  id               :integer          not null, primary key
#  external_id      :integer
#  external_url     :string
#  type             :string
#  author           :string
#  licence          :string
#  publication_date :date
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class MediaContent < ApplicationRecord
  include Featurable
  acts_as_taggable

  TYPE_ALBUM = "Album"
  TYPE_PHOTO = "Photo"

  has_many :media_supports, dependent: :destroy
  has_many :activities, through: :media_supports, source: :activity
  has_many :publications, through: :media_supports, source: :publication

  has_many :news_media_contents, dependent: :destroy
  has_many :news_articles, through: :news_media_contents

  scope :wo_photos_in_album, -> { where("type <> 'Photo' OR (type = 'Photo' AND album_id IS NULL)")}
  scope :by_type, ->(type) { where(type: type) }
  scope :by_tags, ->(tags) { joins(:tags).where(tags: { id: tags }) }

  # relations added here to allow lazy loading on media_library_controller
  has_many :photo_sizes, foreign_key: :photo_id
  has_many :photos, foreign_key: :album_id

  def get_url(size)
    picture_url = case self.type
      when MediaContent::TYPE_ALBUM
        nil
      when MediaContent::TYPE_PHOTO
        media.photo_sizes.where(size: size).first.url
      else
        nil
      end

    picture_url
  end

  class << self
    def fetch_all(options)
      tags = options['tags'].split(',')               if options['tags'].present?
      type = options['type']                          if options['type'].present?

      media_contents = MediaContent.wo_photos_in_album.
        includes(:photo_sizes, :photos).
        order("publication_date DESC, id ASC")
      media_contents = media_contents.by_tags(tags)   if tags.present?
      media_contents = media_contents.by_type(type)   if type.present?
      media_contents
    end
  end

  def info_title
    "#{title} (#{type})"
  end
end
