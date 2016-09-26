require 'rails_helper'

module Backend
  RSpec.describe PublicationsController, type: :controller do
    routes { Backend::Engine.routes }

    before :each do
      @publication = create(:publication)
      @adminuser = create(:user, email: 'admin@sample.com', active: true, role: 'admin', first_name: 'Juanito')
    end

    let!(:test_title) do
      "About section title"
    end

    let!(:attri) do
      { title: test_title, exposure_slug: 'my-slug' }
    end

    let!(:attri_fail) do
      { title: '' }
    end

    context 'For publications' do
      before :each do
        sign_in @adminuser
      end

      it 'GET index returns http success' do
        process :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'GET edit returns http success' do
        process :edit, params: { id: @publication.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      render_views

      it 'Update publication' do
        process :update, method: :put, params: { id: @publication.id, publication: attri }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
        expect(@publication.reload.title).to eq(test_title)
      end

      it 'Validate publication title presence' do
        process :update, method: :put, params: { id: @publication.id, publication: attri_fail }
        expect(response.body).to match('can&#39;t be blank')
      end

      it 'Publishes publication' do
        unpublished = create(:publication, is_published: false)
        process :publish, method: :patch, params: { id: @publication.id }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
        expect(@publication.reload.published?).to be(true)
      end

      it 'Unpublishes publication' do
        process :unpublish, method: :patch, params: { id: @publication.id }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
        expect(@publication.reload.unpublished?).to be(true)
      end
    end
  end
end
