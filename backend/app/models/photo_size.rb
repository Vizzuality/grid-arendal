class PhotoSize < ApplicationRecord
  belongs_to :photo

  ORIGINAL = "Original"
  LARGE = "Large"
  MEDIUM = "Medium"
  SMALL = "Small"

  LABELS = [ORIGINAL, LARGE, MEDIUM, SMALL]
end
