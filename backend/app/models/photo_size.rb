class PhotoSize < ApplicationRecord
  belongs_to :photo

  ORIGINAL = "Original"
  LARGE = "Large"
  MEDIUM = "Medium"
  SMALL = "Small"

  LABELS = [ORIGINAL, LARGE, MEDIUM, SMALL]

  def is_vertical
    return ((self.height / 100) * 70) >= self.width
  end
end
