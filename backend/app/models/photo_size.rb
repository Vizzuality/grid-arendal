class PhotoSize < ApplicationRecord
  belongs_to :photo

  ORIGINAL = "Original"
  LARGE = "Large"
  MEDIUM = "Medium"
  SMALL = "Small"
end
