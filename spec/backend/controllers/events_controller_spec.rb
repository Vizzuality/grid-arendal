require 'rails_helper'

module Backend
  RSpec.describe EventsController, type: :controller do
    routes { Backend::Engine.routes }

    before :each do
      @partner_event = create(:partner_event, active: true)
      @event         = create(:event)
      @adminuser     = create(:user, email: 'admin@sample.com', active: true, role: 'admin', first_name: 'Juanito')
    end

    let!(:attri) do
      { title: 'Update partner event' }
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

      it 'GET show returns http success' do
        process :show, params: { id: @partner_event.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'GET edit returns http success' do
        process :edit, params: { id: @partner_event.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'Update event' do
        process :update, method: :put, params: { id: @partner_event.id, event: attri }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end

      render_views

      it 'Validate event title presence' do
        process :update, method: :put, params: { id: @event.id, event: attri_fail }
        expect(response.body).to match('can&#39;t be blank')
      end
    end

    context 'AdminUser should be able to activate and deactivate event' do
      before :each do
        sign_in @adminuser
      end

      it 'Activate event' do
        process :activate, params: { id: @event.id }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
        @event.reload
        expect(@event.activated?).to eq(true)
      end

      it 'Deactivate event' do
        process :deactivate, params: { id: @partner_event.id }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
        @partner_event.reload
        expect(@partner_event.deactivated?).to eq(true)
      end
    end
  end
end
