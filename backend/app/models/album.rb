# frozen_string_literal: true
# == Schema Information
#
# Table name: albums
#
#  id               :integer          not null, primary key
#  media_content_id :integer
#  photoset_id      :string
#  photoset_url     :string
#  albumable_count  :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  main_photo_id    :string
#  main_photo_url   :string
#
# Indexes
#
#  index_albums_on_media_content_id  (media_content_id)
#
# Foreign Keys
#
#  fk_rails_cb6e2b0eec  (media_content_id => media_contents.id)
#

class Album < ApplicationRecord
  include Sanitizable

  belongs_to :media_content, foreign_key: :media_content_id, touch: true

  validates :photoset_id,  presence: true
  validates :photoset_url, presence: true

  scope :is_cover_in_albums, -> (main_photo_id) { select(:main_photo_id).where(main_photo_id: main_photo_id) }
end
