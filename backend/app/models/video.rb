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

class Video < MediaContent
  acts_as_taggable

  PROVIDER_YOUTUBE = "youtube"
  PROVIDER_VIMEO = "vimeo"

  scope :not_in_album, -> { where(album_id: nil)}

  belongs_to :video_collection, foreign_key: :album_id
  alias_attribute :album, :video_collection

end
