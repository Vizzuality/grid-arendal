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

  scope :not_in_album, -> { where(album_id: nil)}

  has_many :photo_sizes, dependent: :destroy
  belongs_to :album

  delegate :activities, to: :album
  delegate :publications, to: :album
  delegate :news_article, to: :album
end
