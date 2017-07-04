# == Schema Information
#
# Table name: event_partners
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  partner_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Foreign Keys
#
#  fk_rails_8d27e6482c  (partner_id => partners.id)
#  fk_rails_8eb6b18861  (event_id => events.id)
#

class EventPartner < ApplicationRecord
  belongs_to :partner
  belongs_to :event
end
