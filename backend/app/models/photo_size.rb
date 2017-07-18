# == Schema Information
#
# Table name: photo_sizes
#
#  id       :integer          not null, primary key
#  photo_id :integer
#  size     :string
#  width    :integer
#  height   :integer
#  url      :string
#  label    :string
#
# Indexes
#
#  index_photo_sizes_on_label     (label)
#  index_photo_sizes_on_photo_id  (photo_id)
#
# Foreign Keys
#
#  fk_rails_8b5ed87942  (photo_id => media_contents.id)
#

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
