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
  TYPE_VIDEO = "Video"
  TYPE_GRAPHIC = "Graphic"
  TYPE_COLLECTION = "Collection"
  TYPE_VIDEO_COLLECTION = "VideoCollection"

  # {display => filter_types}
  FILTERS = {
    TYPE_GRAPHIC => TYPE_COLLECTION,
    TYPE_PHOTO => TYPE_ALBUM,
    TYPE_VIDEO => [TYPE_VIDEO, TYPE_VIDEO_COLLECTION]
  }

  has_many :media_supports, dependent: :destroy
  has_many :activities, through: :media_supports, source: :activity
  has_many :publications, through: :media_supports, source: :publication

  has_many :news_media_contents, dependent: :destroy
  has_many :news_articles, through: :news_media_contents

  scope :by_type, ->(media) { where(type: media) }
  scope :by_tags, ->(tags) { joins(:tags).where(tags: { id: tags }) }
  scope :albums_and_photos, -> {where(type: [TYPE_ALBUM, TYPE_PHOTO])}
  scope :collections_and_graphics, -> {where(type: [TYPE_COLLECTION, TYPE_GRAPHIC])}
  scope :albums_collections_and_videos, -> {where('type IN (?) OR (type = ? AND album_id IS NULL)', [TYPE_ALBUM, TYPE_COLLECTION, TYPE_VIDEO_COLLECTION], TYPE_VIDEO)}
  scope :video_collections_and_videos, -> {where(type: [TYPE_VIDEO_COLLECTION, TYPE_VIDEO])}

  # relations added here to allow lazy loading on media_library_controller
  has_many :photo_sizes, foreign_key: :photo_id
  has_many :photos, foreign_key: :album_id

  def single?
    [TYPE_PHOTO, TYPE_VIDEO, TYPE_GRAPHIC].include?(type)
  end

  def set?
    [TYPE_ALBUM, TYPE_COLLECTION, TYPE_VIDEO_COLLECTION].include?(type)
  end

  def biggest_size_url
    photo = biggest_size
    photo && photo.url or ""
  end

  def biggest_size
    return nil unless [TYPE_PHOTO, TYPE_GRAPHIC].include?(type)
    ordr = <<-SQL
      CASE
        WHEN label = '#{PhotoSize::LARGE}'
          THEN 0
        WHEN label = '#{PhotoSize::MEDIUM}'
          THEN 1
        WHEN label = '#{PhotoSize::ORIGINAL}'
          THEN 2
        ELSE 3
      END
    SQL
    photo_sizes.
      where(label: [PhotoSize::LARGE, PhotoSize::MEDIUM, PhotoSize::ORIGINAL]).
      where.not(url: nil).
      order(ordr).limit(1).first
  end

  class << self
    def fetch_all(options)
      tags = options['tags'].split(',')               if options['tags'].present?
      media = options['media']                          if options['media'].present?

      media_contents = MediaContent.albums_collections_and_videos.
        includes(:photo_sizes, :photos).
        order("publication_date DESC, id ASC")
      media_contents = media_contents.by_tags(tags)   if tags.present?
      media_contents = media_contents.by_type(FILTERS[media])   if media.present?
      media_contents
    end
  end

  def info_title
    "#{title} (#{type})"
  end
end
