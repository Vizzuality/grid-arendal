# == Schema Information
#
# Table name: events
#
#  id                            :integer          not null, primary key
#  title                         :string
#  description                   :text
#  web_url                       :string
#  background_image_file_name    :string
#  background_image_content_type :string
#  background_image_file_size    :integer
#  background_image_updated_at   :datetime
#  active                        :boolean          default(FALSE), not null
#  deactivated_at                :datetime
#  partner_id                    :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
# Indexes
#
#  index_events_on_partner_id  (partner_id)
#

require 'rails_helper'

RSpec.describe Event, type: :model do
  before :each do
    @event = create(:event)
  end

  it 'Events count' do
    expect(Event.count).to eq(1)
  end

  it 'Active inactive event filter' do
    expect(Event.count).to eq(1)
    @event.activate
    expect(@event.activated?).to be(true)
    expect(Event.filter_actives.count).to be(1)
    @event.deactivate
    expect(Event.filter_inactives.count).to eq(1)
    expect(@event.deactivated?).to be(true)
  end

  let(:event)         { create(:event, title: 'Event without partner', active: true) }
  let(:partner_event) { create(:partner_event, title: 'Partner event', active: true) }

  it 'Build event withot partner' do
    expect(event).to         be_valid
    expect(event.partners).to be_empty
  end

  it 'Build event owned by partner' do
    expect(partner_event).to         be_valid
    expect(partner_event.partners).to be_present
  end
end
