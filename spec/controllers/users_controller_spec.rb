require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #show" do
    before :each do
      @user = create(:user)
    end

    it 'GET show returns http success' do
      process :show, params: { id: @user.id }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

end
