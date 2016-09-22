# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  recontributor_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  organization           :string
#  current_position       :string
#  web_url                :string
#  active                 :boolean          default(FALSE), not null
#  deactivated_at         :datetime
#  role                   :integer          default("contributor"), not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = create(:user)
  end

  it 'Users count' do
    expect(User.count).to eq(1)
  end

  it 'Active inactive user filter' do
    expect(User.count).to eq(1)
    @user.activate
    expect(@user.activated?).to be(true)
    expect(User.filter_actives.count).to be(1)
    @user.deactivate
    expect(User.filter_inactives.count).to eq(1)
    expect(@user.deactivated?).to be(true)
  end

  let(:user) { create(:user, first_name: 'Tobias', last_name: 'Thomas', email: 'tobias.thomas@example.com') }

  it 'should calculate display names' do
    expect(user.display_name).to eq('Tobias T.')
    expect(user.full_name).to eq('Tobias Thomas')

    # No name display email prefix
    user.first_name = nil
    user.last_name  = nil
    expect(user.display_name).to eq('tobias.thomas')
  end
end
