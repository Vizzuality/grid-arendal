require 'rails_helper'

module Backend
  RSpec.describe ActivitiesController, type: :controller do
    routes { Backend::Engine.routes }

    before :each do
      @activity = create(:activity)
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

    context 'For activities' do
      before :each do
        sign_in @adminuser
      end

      it 'GET index returns http success' do
        process :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'GET edit returns http success' do
        process :edit, params: { id: @activity.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      render_views

      it 'Update activity' do
        process :update, method: :put, params: { id: @activity.id, activity: attri }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
        expect(@activity.reload.title).to eq(test_title)
      end

      it 'Validate activity title presence' do
        process :update, method: :put, params: { id: @activity.id, activity: attri_fail }
        expect(response.body).to match('can&#39;t be blank')
      end

      it 'Publishes activity' do
        unpublished = create(:activity, is_published: false)
        process :publish, method: :patch, params: { id: @activity.id }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
        expect(@activity.reload.published?).to be(true)
      end

      it 'Unpublishes activity' do
        process :unpublish, method: :patch, params: { id: @activity.id }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
        expect(@activity.reload.unpublished?).to be(true)
      end
    end
  end
end
