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

class Photo < MediaContent
  include FlickrSync
  include PgSearch

  scope :not_in_album, -> { where(album_id: nil)}
  scope :order_by_date_behind_value, ->(id) { order("(id = #{id}) DESC, publication_date DESC") }

  pg_search_scope :search_for,
    against: { title: :A },
    associated_against: { album: { title: :B, description: :B } },
    using: { tsearch: { any_word: true, prefix: true } },
    order_within_rank: 'updated_at DESC'

  has_many :photo_sizes, dependent: :destroy
  belongs_to :album

  delegate :activities, to: :album, allow_nil: true
  delegate :publications, to: :album, allow_nil: true
  delegate :news_articles, to: :album, allow_nil: true

  # as background picture
  has_many :contents, dependent: :nullify, foreign_key: :media_content_id

  def medium_or_small_url
    ordr = <<-SQL
      CASE
        WHEN label = '#{PhotoSize::MEDIUM}'
          THEN 0
        WHEN label = '#{PhotoSize::SMALL}'
          THEN 1
        ELSE 3
      END
    SQL
    photo_sizes.
      where(label: [PhotoSize::MEDIUM, PhotoSize::SMALL]).
      where.not(url: nil).
      order(ordr).limit(1).first.try(:url)
  end

  class << self
    def photos(params, limit)
      query_where = get_filter_condition(params, 'title')

      if query_where.present?
        Photo
          .where(query_where, "%#{params[:search]}%")
          .order(publication_date: :desc)
      else
        Photo.order(publication_date: :desc).limit(limit)
      end
    end
  end
end
