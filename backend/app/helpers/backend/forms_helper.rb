# frozen_string_literal: true
module Backend
  module FormsHelper
    def is_cover_photo?(media_content, photo)
      media_content.main_photo_id.present? && media_content.main_photo_id == photo.photo_id
    end
  end
end
