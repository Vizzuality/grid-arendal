require 'rails_helper'

module Backend
  RSpec.describe AboutSectionsController, type: :controller do
    routes { Backend::Engine.routes }

    before :each do
      @about_section   = create(:about_section)
      @adminuser = create(:user, email: 'admin@sample.com', active: true, role: 'admin', first_name: 'Juanito')
    end

    let!(:test_title) do
      "About section title"
    end

    let!(:attri) do
      { title: test_title, body: 'the content goes here' }
    end

    let!(:attri_fail) do
      { title: '' }
    end

    context 'For about_sections' do
      before :each do
        sign_in @adminuser
      end

      it 'GET index returns http success' do
        process :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'GET edit returns http success' do
        process :edit, params: { id: @about_section.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      render_views

      it 'Update about_section' do
        process :update, method: :put, params: { id: @about_section.id, about_section: attri }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
        expect(@about_section.reload.title).to eq(test_title)
      end

      it 'Validate about_section title presence' do
        process :update, method: :put, params: { id: @about_section.id, about_section: attri_fail }
        expect(response.body).to match('can&#39;t be blank')
      end
    end
  end
end
