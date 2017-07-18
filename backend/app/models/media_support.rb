# frozen_string_literal: true
# == Schema Information
#
# Table name: media_supports
#
#  id               :integer          not null, primary key
#  content_id       :integer
#  media_content_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_media_supports_on_content_id        (content_id)
#  index_media_supports_on_media_content_id  (media_content_id)
#
# Foreign Keys
#
#  fk_rails_06ec4a88b0  (content_id => contents.id)
#  fk_rails_0a2db6dc63  (media_content_id => media_contents.id)
#

class MediaSupport < ApplicationRecord
  belongs_to :content
  belongs_to :media_content
  belongs_to :activity, foreign_key: :content_id, class_name: 'Activity'
  belongs_to :publication, foreign_key: :content_id, class_name: 'Publication'

  validates :content_id, uniqueness: { scope: :media_content_id }
end
