require 'rails_helper'

module Backend
  RSpec.describe VacanciesController, type: :controller do
    routes { Backend::Engine.routes }

    before :each do
      @vacancy = create(:vacancy)
      @adminuser = create(:user, email: 'admin@sample.com', active: true, role: 'admin', first_name: 'Juanito')
    end

    let!(:test_title) do
      "About section title"
    end

    let!(:attri) do
      { title: test_title, description: 'my description' }
    end

    let!(:attri_fail) do
      { title: '' }
    end

    context 'For vacancies' do
      before :each do
        sign_in @adminuser
      end

      it 'GET index returns http success' do
        process :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'GET edit returns http success' do
        process :edit, params: { id: @vacancy.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      render_views

      it 'Update vacancy' do
        process :update, method: :put, params: { id: @vacancy.id, vacancy: attri }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
        expect(@vacancy.reload.title).to eq(test_title)
      end

      it 'Validate vacancy title presence' do
        process :update, method: :put, params: { id: @vacancy.id, vacancy: attri_fail }
        expect(response.body).to match('can&#39;t be blank')
      end

      it 'Publishes vacancy' do
        unpublished = create(:vacancy, is_published: false)
        process :publish, method: :patch, xhr: true,
          params: { id: @vacancy.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(@vacancy.reload.published?).to be(true)
      end

      it 'Unpublishes vacancy' do
        process :unpublish, method: :patch, xhr: true,
          params: { id: @vacancy.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(@vacancy.reload.unpublished?).to be(true)
      end
    end
  end
end
