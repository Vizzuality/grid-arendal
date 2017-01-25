# == Schema Information
#
# Table name: media_contents
#
#  id               :integer          not null, primary key
#  external_id      :integer
#  external_url     :string
#  type             :string
#  author           :string
#  licence          :string
#  publication_date :date
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class VideoCollection < MediaContent
  has_many :videos, dependent: :destroy, foreign_key: :album_id
  alias_attribute :items, :videos

  def first_video
    videos.order(:id).first
  end

  def video_url
    first_video.try(:video_url)
  end

  def video_provider
    first_video.video_provider
  end

  def video_id
    first_video.video_id
  end
end
