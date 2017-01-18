# frozen_string_literal: true
class EventContent < ApplicationRecord
  belongs_to :content
  belongs_to :event
  belongs_to :activity, foreign_key: :content_id, class_name: 'Activity'
  belongs_to :publication, foreign_key: :content_id, class_name: 'Publication'
end
