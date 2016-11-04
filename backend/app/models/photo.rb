# frozen_string_literal: true
# == Schema Information
#
# Table name: photos
#
#  id               :integer          not null, primary key
#  media_content_id :integer
#  photo_id         :string
#  photo_url        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_photos_on_media_content_id  (media_content_id)
#
# Foreign Keys
#
#  fk_rails_3421707de3  (media_content_id => media_contents.id)
#

class Photo < ApplicationRecord
  include Sanitizable

  belongs_to :media_content, foreign_key: :media_content_id, touch: true

  validates :photo_id,  presence: true
  validates :photo_url, presence: true
end
