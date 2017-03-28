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
  include FlickrSync
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
