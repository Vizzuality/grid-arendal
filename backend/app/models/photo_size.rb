class PhotoSize < ApplicationRecord
  belongs_to :photo

  ORIGINAL = "Original"
  LARGE = "Large"
  LARGE_SQUARE = "Large Square"
  MEDIUM = "Medium"
  SMALL = "Small"

  DISPLAY = { SMALL => "S", MEDIUM => "M", LARGE => "L", ORIGINAL => "XL",
              LARGE_SQUARE => "LS" }

  LABELS = [ORIGINAL, LARGE, LARGE_SQUARE, MEDIUM, SMALL]

  def is_vertical?
    return ((self.height / 100) * 70) >= self.width
  end
end
