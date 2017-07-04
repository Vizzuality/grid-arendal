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
# Foreign Keys
#
#  fk_rails_19e5ee321a  (content_id => contents.id)
#  fk_rails_b9a3c50f15  (user_id => users.id)
#

class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :content
  belongs_to :activity, foreign_key: :content_id, class_name: 'Activity'
  belongs_to :publication, foreign_key: :content_id, class_name: 'Publication'
end
