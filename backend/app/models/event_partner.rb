class EventPartner < ApplicationRecord
  belongs_to :partner
  belongs_to :event
end
