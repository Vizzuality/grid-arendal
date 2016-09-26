require 'rails_helper'

module Backend
  RSpec.describe UsersController, type: :controller do
    routes { Backend::Engine.routes }

    before :each do
      @user   = create(:user, active: true)
      @user_2 = create(:user, email: Faker::Internet.email, active: false, role: 'publisher')
      @user_3 = create(:user, email: Faker::Internet.email, active: true, first_name: 'Pepe')

      @adminuser = create(:user, email: 'admin@sample.com', active: true, role: 'admin', first_name: 'Juanito')
    end

    let!(:attri) do
      { first_name: 'newfirst', last_name: 'newlast' }
    end

    let!(:attri_fail) do
      { email: '' }
    end

    context 'For authenticated user' do
      before :each do
        sign_in @user
      end

      it 'GET index returns http success' do
        process :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'GET show returns http success' do
        process :show, params: { id: @user.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'GET edit returns http success' do
        process :edit, params: { id: @user.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'GET edit for xx user returns http redirect' do
        process :edit, params: { id: @user_2.id }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end

      it 'update user' do
        process :update, method: :put, params: { id: @user.id, user: attri }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
    end

    context 'Users' do
      it 'GET index returns http redirect for non logged in user' do
        process :index
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end

      it 'GET show returns http redirect for non logged in user' do
        process :show, params: { id: @user.id }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
    end

    context 'AdminUser should be able to activate and deactivate user' do
      before :each do
        sign_in @adminuser
      end

      it 'Activate user' do
        process :activate, params: { id: @user_2.id }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
        @user_2.reload
        expect(@user_2.activated?).to eq(true)
      end

      it 'Deactivate user' do
        process :deactivate, params: { id: @user.id }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
        @user.reload
        expect(@user.deactivated?).to eq(true)
      end
    end

    context 'AdminUser should be able to set up roles for user' do
      before :each do
        @adminuser_2 = create(:user, email: Faker::Internet.email, active: true, role: 'admin')
        sign_in @adminuser
      end

      it 'Make the contributor admin' do
        process :make_admin, params: { id: @user_2.id }

        expect(response).to              be_redirect
        expect(response).to              have_http_status(302)
        expect(@user_2.reload.admin?).to eq(true)
      end

      it 'Make the contributor publisher' do
        process :make_publisher, params: { id: @user_3.id }

        expect(response).to                be_redirect
        expect(response).to                have_http_status(302)
        expect(@user_3.reload.publisher?).to eq(true)
      end

      it 'Revoke admin role for user' do
        expect(@adminuser_2.admin?).to eq(true)
        process :make_contributor, params: { id: @adminuser_2.id }

        expect(response).to                   be_redirect
        expect(response).to                   have_http_status(302)
        expect(@adminuser_2.reload.admin?).to eq(false)
      end

      it 'Revoke publisher role for user' do
        expect(@user_2.publisher?).to eq(true)
        process :make_contributor, params: { id: @user_2.id }

        expect(response).to                be_redirect
        expect(response).to                have_http_status(302)
        expect(@user_2.reload.publisher?).to eq(false)
      end
    end
  end
end
