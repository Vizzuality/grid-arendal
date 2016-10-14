# frozen_string_literal: true
module Backend
  module FormsHelper
    def is_cover_photo?(media_content, photo)
      media_content.try(:main_photo_id) == photo.try(:photo_id) if media_content.try(:main_photo_id).present?
    end
  end
end
