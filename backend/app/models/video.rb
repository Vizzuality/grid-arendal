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

class Video < MediaContent
  acts_as_taggable

  PROVIDER_YOUTUBE = "youtube"
  PROVIDER_VIMEO = "vimeo"
  YOUTUBE_URL = "https://www.youtube.com/embed/%s?autoplay=1"
  VIMEO_URL = "https://player.vimeo.com/video/%s?autoplay=1"

  scope :not_in_album, -> { where(album_id: nil)}

  belongs_to :video_collection, foreign_key: :album_id
  alias_attribute :album, :video_collection

  def video_url
    if video_provider
      Video.const_get("#{video_provider.upcase}_URL") % video_id
    else
      nil
    end
  end

  def video_provider
    return PROVIDER_YOUTUBE if external_url.include?(PROVIDER_YOUTUBE)
    return PROVIDER_VIMEO if external_url.include?(PROVIDER_VIMEO)
    nil
  end

  def video_id
    case video_provider
      when PROVIDER_YOUTUBE
        external_url.split('=').last
      when PROVIDER_VIMEO
        external_url.split('/').last
      else
        nil
    end
  end
end
