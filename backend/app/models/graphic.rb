# frozen_string_literal: true
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

class Graphic < MediaContent
  acts_as_taggable
  belongs_to :collection, foreign_key: :album_id
  belongs_to :eps, class_name: "MediaAttachment", foreign_key: :eps_id,
    dependent: :destroy
  accepts_nested_attributes_for :eps
  belongs_to :pdf, class_name: "MediaAttachment", foreign_key: :pdf_id,
    dependent: :destroy
  accepts_nested_attributes_for :pdf
  alias_attribute :album, :collection

  has_many :photo_sizes, dependent: :destroy, foreign_key: :photo_id

  delegate :activities, to: :collection
  delegate :publications, to: :collection
  delegate :news_article, to: :collection

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
    def graphics(params, limit)
      query_where = get_filter_condition(params, 'title')

      if query_where.present?
        Graphic
          .where(query_where, "%#{params[:search]}%")
          .order(publication_date: :desc)
      else
        Graphic.order(publication_date: :desc).limit(limit)
      end
    end
  end
end
