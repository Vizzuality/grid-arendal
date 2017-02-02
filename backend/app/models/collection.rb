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

class Collection < MediaContent
  include FlickrSync
  has_many :graphics, dependent: :destroy, foreign_key: :album_id
  alias_attribute :items, :graphics

  class << self
    def collections(search, limit)
      if search.present? and search != ''
        self
          .where("UPPER(title) like UPPER(?)", "%#{search}%")
          .order(publication_date: :desc)
      else
        self.order(publication_date: :desc).limit(limit)
      end
    end
  end
end
