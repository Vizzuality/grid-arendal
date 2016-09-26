require 'rails_helper'

module Backend
  RSpec.describe PartnersController, type: :controller do
    routes { Backend::Engine.routes }

    before :each do
      @partner   = create(:partner)
      @adminuser = create(:user, email: 'admin@sample.com', active: true, role: 'admin', first_name: 'Juanito')
    end

    let!(:attri) do
      { name: 'Partner name', web_url: 'sample-partner.net' }
    end

    let!(:attri_fail) do
      { name: '' }
    end

    context 'For partners' do
      before :each do
        sign_in @adminuser
      end

      it 'GET index returns http success' do
        process :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'GET show returns http success' do
        process :show, params: { id: @partner.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'GET edit returns http success' do
        process :edit, params: { id: @partner.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      render_views

      it 'Update partner' do
        process :update, method: :put, params: { id: @partner.id, partner: attri }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
        expect(@partner.reload.web_url).to eq('http://sample-partner.net')
      end

      it 'Validate partner name presence' do
        process :update, method: :put, params: { id: @partner.id, partner: attri_fail }
        expect(response.body).to match('can&#39;t be blank')
      end
    end
  end
end
