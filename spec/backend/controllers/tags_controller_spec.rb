require 'rails_helper'

module Backend
  RSpec.describe TagsController, type: :controller do
    routes { Backend::Engine.routes }

    before :each do
      @tag         = create(:tag)
      @adminuser     = create(:user, email: 'admin@sample.com', active: true, role: 'admin', first_name: 'Juanito')
    end

    let!(:attri) do
      { name: 'Update content type' }
    end

    let!(:attri_fail) do
      { name: '' }
    end

    context 'For authenticated user' do
      before :each do
        sign_in @adminuser
      end

      it 'GET index returns http success' do
        process :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'GET edit returns http success' do
        process :edit, params: { id: @tag.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'Update content type' do
        process :update, method: :put, params: { id: @tag.id, tag: attri }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end

      render_views

    end
  end
end
