# == Schema Information
#
# Table name: media_contents
#
#  id                  :integer          not null, primary key
#  external_id         :string
#  external_url        :string
#  type                :string
#  author              :string
#  licence             :string
#  publication_date    :date
#  description         :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  title               :string
#  album_id            :integer
#  external_updated_at :datetime
#  is_featured         :boolean
#  eps_id              :integer
#  pdf_id              :integer
#
# Indexes
#
#  index_media_contents_on_album_id                              (album_id)
#  index_media_contents_on_to_tsvector_title_description_author  ((((setweight(to_tsvector('simple'::regconfig, COALESCE((title)::text, ''::text)), 'A'::"char") || setweight(to_tsvector('simple'::regconfig, COALESCE(description, ''::text)), 'B'::"char")) || setweight(to_tsvector('simple'::regconfig, COALESCE((author)::text, ''::text)), 'B'::"char"))))
#
# Foreign Keys
#
#  fk_rails_03d0073c72  (pdf_id => media_attachments.id)
#  fk_rails_b2d6cb67fb  (eps_id => media_attachments.id)
#  fk_rails_cb9ba8e413  (album_id => media_contents.id)
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

  class << self
    def videos(params, limit)
      query_where = get_filter_condition(params, 'title')

      if query_where.present?
        Video
          .where(query_where, "%#{params[:search]}%")
          .order(:title)
      else
        Video.order(:title).limit(limit)
      end
    end
  end
end
