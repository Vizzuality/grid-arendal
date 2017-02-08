require 'rails_helper'

RSpec.describe GraphicRequest, type: :model do
  it 'Sets download_hash on create' do
    graphic = Graphic.create
    media_attachment = MediaAttachment.create
    graphic_req = GraphicRequest.new(email: "derp@derp.com",
                                     graphic_id: graphic.id,
                                     media_attachment_id: media_attachment.id)
    graphic_req.save
    expect(graphic_req.download_hash).not_to be(nil)
  end
end
