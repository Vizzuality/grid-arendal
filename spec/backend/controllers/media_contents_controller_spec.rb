require 'rails_helper'

module Backend
  RSpec.describe MediaContentsController, type: :controller do
    routes { Backend::Engine.routes }

    before :each do
      @photo_content = create(:photo_content, is_published: true)
      @album_content = create(:album_content, is_published: false)
      @adminuser     = create(:user, email: 'admin@sample.com', active: true, role: 'admin', first_name: 'Albert')
      allow(controller).to receive(:set_flickr).and_return(true)
    end

    let!(:attri) do
      { title: 'Updated media content' }
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
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end

      it 'GET edit returns http success' do
        process :edit, params: { id: @photo_content.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'Update photo_content' do
        allow(FlickrService).to receive(:update_asset).and_return(true)
        process :update, method: :put, params: { id: @photo_content.id, media_content: attri }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end

      it 'Update album_content' do
        allow(FlickrService).to receive(:update_asset).and_return(true)
        process :update, method: :put, params: { id: @album_content.id, media_content: attri }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end

      render_views

      it 'Validate photo_content title presence' do
        process :update, method: :put, params: { id: @photo_content.id, media_content: attri_fail }
        expect(response).to redirect_to(edit_media_content_path(@photo_content))
      end
    end

    context 'AdminUser should be able to publish and unpublish media content' do
      before :each do
        sign_in @adminuser
      end

      it 'Publish media content' do
        process :publish, params: { id: @album_content.id }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
        @album_content.reload
        expect(@album_content.published?).to eq(true)
      end

      it 'Unpublish media content' do
        process :unpublish, params: { id: @photo_content.id }
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
        @photo_content.reload
        expect(@photo_content.unpublished?).to eq(true)
      end
    end
  end
end
