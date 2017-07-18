# frozen_string_literal: true
# == Schema Information
#
# Table name: event_contents
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  content_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Foreign Keys
#
#  event_contents_content_id_fk  (content_id => contents.id)
#  event_contents_event_id_fk    (event_id => events.id)
#

class EventContent < ApplicationRecord
  belongs_to :content
  belongs_to :event
  belongs_to :activity, foreign_key: :content_id, class_name: 'Activity'
  belongs_to :publication, foreign_key: :content_id, class_name: 'Publication'
end
