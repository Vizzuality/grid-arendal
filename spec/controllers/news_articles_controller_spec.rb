require 'rails_helper'

RSpec.describe NewsArticlesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    before :each do
      @news_article = create(:news_article)
    end

    it 'GET show returns http success' do
      process :show, params: { id: @news_article.id }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

end
