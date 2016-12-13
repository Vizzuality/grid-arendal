class PhotoSize < ApplicationRecord
  belongs_to :photo

  ORIGINAL = "original"
  LARGE = "large"
  MEDIUM = "medium"
  SMALL = "small"
end