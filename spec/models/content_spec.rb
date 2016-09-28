# == Schema Information
#
# Table name: contents
#
#  id                   :integer          not null, primary key
#  type                 :string
#  title                :string
#  description          :text
#  is_published         :boolean
#  position             :integer
#  story_map_url        :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

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
