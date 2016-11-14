# == Schema Information
#
# Table name: media_contents
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  is_published :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe MediaContent, type: :model do
  before :each do
    @album = create(:album_content)
    @photo = create(:photo_content)
  end

  it 'media_contents count' do
    expect(MediaContent.count).to        eq(2)
    expect(MediaContent.photos.count).to eq(1)
    expect(MediaContent.albums.count).to eq(1)
  end

  it 'Publish unpublish media_content filter' do
    expect(MediaContent.count).to eq(2)
    expect(@album.is_published?).to be(true)
    expect(MediaContent.published.count).to be(2)
    @album.unpublish
    expect(MediaContent.unpublished.count).to eq(1)
    expect(@album.unpublished?).to be(true)
  end

  let(:album) { create(:media_content_blank, title: 'MediaContent for album')  }
  let(:photo) { create(:media_content_blank, title: 'MediaContent for photo') }

  let(:album_params) {
    { photoset_url: Faker::Internet.url('example.com', '/album/first-album'),
      photoset_id: '1111-2222-3333-4444' }
  }

  let(:photo_params) {
    { photo_url: Faker::Internet.url('example.com', '/photo/first-photo'),
      photo_id: '2222-2222-3333-4444' }
  }

  it 'Build media_content for album' do
    expect(album).to be_valid
    # Build album
    album.set_album(album_params)
    expect(album.is_album?).to be_present
  end

  it 'Build media_content for photo' do
    expect(photo).to be_valid
    # Build photo
    photo.set_photo(photo_params)
    expect(photo.is_photo?).to be_present
  end

  it 'Do not allow to set album for existing photo content' do
    expect(@photo).to be_valid
    # Build album
    @photo.set_album(album_params)
    expect(@photo.is_photo?).to be_present
    expect(@photo.is_album?).to be_blank
  end

  it 'Do not allow to set photo for existing album content' do
    expect(@album).to be_valid
    # Build photo
    @album.set_photo(photo_params)
    expect(@album.is_album?).to be_present
    expect(@album.is_photo?).to be_blank
  end
end
