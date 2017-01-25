require 'rails_helper'

RSpec.describe Video, type: :model do
  before(:each) do
    @video_id = "derp"
  end
  it 'Returns youtube video' do
    video = Video.create(external_url: "#{Video::PROVIDER_YOUTUBE}=#{@video_id}")
    expect(video.video_url).to eq(Video::YOUTUBE_URL % @video_id)
  end

  it 'Returns vimeo video' do
    video = Video.create(external_url: "#{Video::PROVIDER_VIMEO}/#{@video_id}")
    expect(video.video_url).to eq(Video::VIMEO_URL % @video_id)
  end

  it 'Returns nil if no video url in correct format' do
    video = Video.create(external_url: "www.abola.pt")
    expect(video.video_url).to eq(nil)
  end
end
