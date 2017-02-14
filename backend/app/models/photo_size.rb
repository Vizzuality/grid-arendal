class PhotoSize < ApplicationRecord
  belongs_to :photo

  ORIGINAL = "Original"
  LARGE = "Large"
  MEDIUM = "Medium"
  SMALL = "Small"

  DISPLAY = { SMALL => "S", MEDIUM => "M", LARGE => "L", ORIGINAL => "XL"}

  LABELS = [ORIGINAL, LARGE, MEDIUM, SMALL]

  def is_vertical?
    return ((self.height / 100) * 70) >= self.width
  end
end
