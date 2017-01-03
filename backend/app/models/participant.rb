# frozen_string_literal: true
# == Schema Information
#
# Table name: participants
#
#  id         :integer          not null, primary key
#  content_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :content
  belongs_to :activity, foreign_key: :content_id, class_name: 'Activity'
  belongs_to :publication, foreign_key: :content_id, class_name: 'Publication'
end
