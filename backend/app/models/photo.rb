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
  scope :order_by_date_behind_value, ->(id) { order("(id = #{id}) DESC, publication_date DESC") }

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
end
