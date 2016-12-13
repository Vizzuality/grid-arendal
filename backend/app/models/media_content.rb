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
  def self.fetch_flickr_data
    set_flickr
    get_albums
    debugger
    true
  end

  def self.set_flickr
    FlickRaw.api_key       = ENV['FLICKR_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_SHARED_SECRET']
    flickr.access_token    = ENV['FLICKR_ACCESS_TOKEN']
    flickr.access_secret   = ENV['FLICKR_ACCESS_SECRET']
  end

  def self.get_albums
    photosets = flickr.photosets.getList
    photosets.each do |photoset|
      album = Album.find_or_initialize_by(external_id: photoset.id)
      album.publication_date = Date.strptime(photoset.date_create, '%s')
      album.title = photoset.title
      album.description = photoset.description

      page = 1
      per_page = 500
      while(page == 1 || page*per_page <= photoset.photos) do
        photos = flickr.photosets.getPhotos(photoset_id: photoset.id, page: page)
        photos.photo.each do |photo|
          photo_info = flickr.photos.getInfo(photo_id: photo.id)
          pic = Photo.find_or_initialize_by(external_id: photo.id)
          pic.title = photo_info.title
          pic.description = photo_info.description
          pic.publication_date = Date.parse(photo_info.dates.taken)
          pic.author = photo_info.owner.realname
          pic.external_url = photo_info.urls.first["_content"]
          flickr.photos.getSizes(photo_id: photo_info.id).each do |size|
            psize = pic.photo_sizes.find_or_initialize_by(label: size.label)
            psize.width = size.width
            psize.height = size.height
            psize.url = size.url
            psize.save
          end
          pic.save
          album.photos << pic
        end
        page += 1
      end
      album.save
    end
  end
end
