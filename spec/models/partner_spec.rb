# == Schema Information
#
# Table name: partners
#
#  id                :integer          not null, primary key
#  name              :string
#  web_url           :string
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  logo_file_name    :string
#  logo_content_type :string
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Partner, type: :model do
  before :each do
    @partner = create(:partner)
  end

  it 'Partners count' do
    expect(Partner.count).to eq(1)
  end

  it 'Partner should be valid' do
    expect(@partner.name).to eq('Partner one')
    expect(@partner.web_url).to eq('http://partner-sample.org')
  end
end
