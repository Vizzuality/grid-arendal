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

class Photo < MediaContent
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

  delegate :activities, to: :album
  delegate :publications, to: :album
  delegate :news_article, to: :album

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

  def update_from_flickr
    Flickr.set_flickr
    photo_info = Flickr.get_photo_info self.external_id
    unless photo_info.nil?
      self.title = photo_info.title
      self.publication_date = Date.parse(photo_info.dates.taken)
      self.external_updated_at = Date.strptime(photo_info.dates.lastupdate, '%s')
      split_it = photo_info.description.split("Author:")
      self.description = split_it[0]
      if self.author.blank?
        # tries to get the author name from description
        self.author = split_it.size > 1 ? split_it[1] : photo_info.owner.realname
      end
      self.external_url = photo_info.urls.first["_content"]
      self.licence = photo_info.license
      if photo_info.tags.any?
        self.tag_list = photo_info.tags.map{|t| t["raw"]}
      end
      Flickr.get_sizes_for(photo_info.id).each do |size|
        psize = self.photo_sizes.find_or_initialize_by(label: size.label)
        psize.width = size.width
        psize.height = size.height
        psize.url = size.source
        psize.save
      end
    end
    self.save
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
