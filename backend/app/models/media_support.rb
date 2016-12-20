# frozen_string_literal: true
class MediaSupport < ApplicationRecord
  belongs_to :content
  belongs_to :media_content
  belongs_to :activity, foreign_key: :content_id, class_name: 'Activity'
  belongs_to :publication, foreign_key: :content_id, class_name: 'Publication'
end
