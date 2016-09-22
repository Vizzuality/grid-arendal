require 'rails_helper'

module Backend
  RSpec.describe UsersController, type: :controller do
    routes { Backend::Engine.routes }

    before :each do
      @user   = create(:user, active: true)
      @user_2 = create(:user, email: Faker::Internet.email, active: false, role: 'manager')
      @user_3 = create(:user, email: Faker::Internet.email, active: true)

      @adminuser = create(:user, email: 'admin@sample.com', active: true, role: 'admin')
    end

    context 'AdminUser should be able to set up roles for user' do
      before :each do
        @adminuser_2 = create(:user, email: Faker::Internet.email, active: true, role: 'admin')
        sign_in @adminuser
      end

      it 'Make the member admin' do
        process :make_admin, params: { id: @user_2.id }

        expect(response).to              be_redirect
        expect(response).to              have_http_status(302)
        expect(@user_2.reload.admin?).to eq(true)
      end

      it 'Make the member manager' do
        process :make_manager, params: { id: @user_3.id }

        expect(response).to                be_redirect
        expect(response).to                have_http_status(302)
        expect(@user_3.reload.manager?).to eq(true)
      end

      it 'Revoke admin role for user' do
        expect(@adminuser_2.admin?).to eq(true)
        process :make_member, params: { id: @adminuser_2.id }

        expect(response).to                   be_redirect
        expect(response).to                   have_http_status(302)
        expect(@adminuser_2.reload.admin?).to eq(false)
      end

      it 'Revoke manager role for user' do
        expect(@user_2.manager?).to eq(true)
        process :make_member, params: { id: @user_2.id }

        expect(response).to                be_redirect
        expect(response).to                have_http_status(302)
        expect(@user_2.reload.manager?).to eq(false)
      end
    end
  end
end
