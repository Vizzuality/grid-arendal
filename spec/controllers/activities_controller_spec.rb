require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    before :each do
      @activity = create(:activity)
    end

    it 'GET show returns http success' do
      process :show, params: { id: @activity.id }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

end
