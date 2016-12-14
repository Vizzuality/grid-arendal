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

class MediaContent < ApplicationRecord
  TYPE_ALBUM = "Album"
  TYPE_PHOTO = "Photo"

  def self.set_flickr
    FlickRaw.api_key       = ENV['FLICKR_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_SHARED_SECRET']
    flickr.access_token    = ENV['FLICKR_ACCESS_TOKEN']
    flickr.access_secret   = ENV['FLICKR_ACCESS_SECRET']
  end

  def get_url(size)
    puts case self.type
      when MediaContent::TYPE_ALBUM
        picture_url = nil
      when MediaContent::TYPE_PHOTO
        picture_url = media.photo_sizes.where(size: size).first.url
      else
        picture_url = nil
      end

    return picture_url
  end
end
