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

class Album < MediaContent
  include FlickrSync
  has_many :photos, dependent: :destroy, foreign_key: :album_id
  alias_attribute :items, :photos

  class << self
    def albums(params, limit)
      query_where = get_filter_condition(params, 'title')

      if query_where.present?
        Album
          .where(query_where, "%#{params[:search]}%")
          .order(publication_date: :desc)
      else
        Album.order(publication_date: :desc).limit(limit)
      end
    end
  end
end
