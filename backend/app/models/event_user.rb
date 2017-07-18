# == Schema Information
#
# Table name: event_users
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Foreign Keys
#
#  event_users_event_id_fk  (event_id => events.id)
#  event_users_user_id_fk   (user_id => users.id)
#

class EventUser < ApplicationRecord
  belongs_to :event
  belongs_to :user
end
