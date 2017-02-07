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

  def video_url
    first_item.try(:video_url)
  end

  def video_provider
    first_item.video_provider
  end

  def video_id
    first_item.video_id
  end

  class << self
    def videos(params, limit)
      query_where = get_filter_condition(params, 'title')

      if query_where.present?
        VideoCollection
          .where(query_where, "%#{params[:search]}%")
          .order(publication_date: :desc)
      else
        VideoCollection.order(publication_date: :desc).limit(limit)
      end
    end
  end
end
