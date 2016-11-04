# frozen_string_literal: true
module Mediable
  extend ActiveSupport::Concern

  included do
    # Media types
    has_one :photo, dependent: :destroy
    has_one :album, dependent: :destroy

    delegate :photo_id, :photo_url,           to: :photo, allow_nil: true
    delegate :photoset_id, :photoset_url,
             :main_photo_url, :main_photo_id, to: :album, allow_nil: true

    scope :photos,             -> { includes(:photo).joins(:photo)                                                                       }
    scope :albums,             -> { includes(:album).joins(:album)                                                                       }
    scope :not_photos,         -> { where.not(id: joins(:photo).select(:media_content_id))                                               }
    scope :not_albums,         -> { where.not(id: joins(:album).select(:media_content_id))                                               }
    scope :is_cover_in_albums, -> (main_photo_id) { joins(:album).select(:main_photo_id).where(albums: { main_photo_id: main_photo_id }) }

    def set_photo(options)
      return false if is_photo? || is_album?
      self.create_photo(options)
    end

    def set_album(options)
      return false if is_photo? || is_album?
      self.create_album(options)
    end

    def update_photo(options)
      self.photo.update(options)
    end

    def update_album(options)
      self.album.update(options)
    end

    def is_photo?
      photo.present?
    end

    def is_album?
      album.present?
    end

    def mediable_id
      if is_photo?
        photo_id
      else
        photoset_id
      end
    end

    def mediable_url
      if is_photo?
        photo_url
      else
        photoset_url
      end
    end

    def mediable_photo_url
      if is_photo? && photo_url.present?
        photo_url
      elsif is_album? && main_photo_url.present?
        main_photo_url
      else
        '/assets/album-sample.jpg'
      end
    end

    def mediable_type
      if is_photo?
        'photo'
      else
        'album'
      end
    end
  end

  class_methods do
  end
end
