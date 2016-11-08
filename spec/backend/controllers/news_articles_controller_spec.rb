require 'rails_helper'

module Backend
  RSpec.describe NewsArticlesController, type: :controller do
    routes { Backend::Engine.routes }

    before :each do
      @news_article = create(:news_article)
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

    context 'For news_articles' do
      before :each do
        sign_in @adminuser
      end

      it 'GET index returns http success' do
        process :index
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end

      it 'GET edit returns http success' do
        process :edit, params: { id: @news_article.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      render_views

      it 'Update news_article' do
        process :update, method: :put, params: { id: @news_article.id, news_article: attri }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
        expect(@news_article.reload.title).to eq(test_title)
      end

      it 'Validate news_article title presence' do
        process :update, method: :put, params: { id: @news_article.id, news_article: attri_fail }
        expect(response.body).to match('can&#39;t be blank')
      end
    end
  end
end
