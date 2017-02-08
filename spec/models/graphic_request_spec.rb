require 'rails_helper'

RSpec.describe GraphicRequest, type: :model do
  it 'Sets download_hash on create' do
    graphic_req = GraphicRequest.new(email: "derp@derp.com")
    graphic_req.save
    expect(graphic_req.download_hash).not_to be(nil)
  end
end
