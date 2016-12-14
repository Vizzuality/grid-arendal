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
  acts_as_taggable

  has_many :photos

  def self.fetch_from_flickr
    set_flickr
    current_total = Album.count
    get_albums
    Album.count - current_total
  end

  def self.get_albums
    photosets = flickr.photosets.getList
    photosets.each do |photoset|
      album = Album.find_or_initialize_by(external_id: photoset.id)
      album.publication_date = Date.strptime(photoset.date_create, '%s')
      album.external_updated_at = DateTime.strptime(photoset.date_update, '%s')
      album.title = photoset.title
      album.description = photoset.description

      page = 1
      per_page = 500
      while(page == 1 || page*per_page <= photoset.photos) do
        photos = flickr.photosets.getPhotos(photoset_id: photoset.id,
                                            page: page,
                                            extras: "last_update,license,date_taken,tags")
        photos.photo.each do |photo|
          pic = Photo.find_or_initialize_by(external_id: photo.id)
          if pic.external_updated_at != photo.lastupdate
            photo_info = flickr.photos.getInfo(photo_id: photo.id)
            pic.title = photo_info.title
            pic.description = photo_info.description
            pic.publication_date = Date.strptime(photo_info.dates.taken, '%s')
            pic.external_updated_at = Date.strptime(photo_info.dates.lastupdate, '%s')
            pic.author = photo_info.owner.realname
            pic.external_url = photo_info.urls.first["_content"]
            pic.licence = photo_info.license
            pic.tag_list = photo.tags
            flickr.photos.getSizes(photo_id: photo_info.id).each do |size|
              psize = pic.photo_sizes.find_or_initialize_by(label: size.label)
              psize.width = size.width
              psize.height = size.height
              psize.url = size.source
              psize.save
            end
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
