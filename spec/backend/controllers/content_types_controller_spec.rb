require 'rails_helper'

module Backend
  RSpec.describe ContentTypesController, type: :controller do
    routes { Backend::Engine.routes }

    before :each do
      @content_type         = create(:content_type)
      @adminuser     = create(:user, email: 'admin@sample.com', active: true, role: 'admin', first_name: 'Juanito')
    end

    let!(:attri) do
      { title: 'Update content type' }
    end

    let!(:attri_fail) do
      { title: '' }
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
        process :edit, params: { id: @content_type.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'Update content type' do
        process :update, method: :put, params: { id: @content_type.id, content_type: attri }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end

      render_views

      it 'Validate content_type title presence' do
        process :update, method: :put, params: { id: @content_type.id, content_type: attri_fail }
        expect(response.body).to match('can&#39;t be blank')
      end
    end
  end
end
