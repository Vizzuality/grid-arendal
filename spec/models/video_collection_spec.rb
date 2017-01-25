require 'rails_helper'

RSpec.describe Video, type: :model do
  before(:each) do
    @video_id = "derp"
  end
  it 'Returns youtube video' do
    coll = VideoCollection.create
    coll.videos << Video.create(external_url: "#{Video::PROVIDER_YOUTUBE}=#{@video_id}")
    expect(coll.video_url).to eq(Video::YOUTUBE_URL % @video_id)
  end

  it 'Returns vimeo video' do
    coll = VideoCollection.create
    coll.videos << Video.create(external_url: "#{Video::PROVIDER_VIMEO}/#{@video_id}")
    coll.videos << Video.create(external_url: "#{Video::PROVIDER_YOUTUBE}=#{@video_id}")
    expect(coll.video_url).to eq(Video::VIMEO_URL % @video_id)
  end

  it 'Returns nil if no video url in correct format' do
    coll = VideoCollection.create
    coll.videos << Video.create(external_url: "www.abola.pt")
    expect(coll.video_url).to eq(nil)
  end
end
