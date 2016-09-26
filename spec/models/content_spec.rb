require 'rails_helper'

RSpec.describe Content, type: :model do
  before :each do
    @content = create(:activity)
  end

  it 'Contents count' do
    expect(Content.count).to eq(1)
  end

  it 'Published unpublished content filter' do
    expect(Content.count).to eq(1)
    @content.publish
    expect(@content.published?).to be(true)
    expect(Content.published.count).to be(1)
    @content.unpublish
    expect(Content.unpublished.count).to eq(1)
    expect(@content.unpublished?).to be(true)
  end
end
