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

  def self.all_albums_from_flickr
    current_total = Album.count
    photosets = Flickr.fetch_albums
    photosets.each do |photoset|
      Album.create_or_update_album_for(photoset.id)
    end
    Album.count - current_total
  end

  def self.create_or_update_album_for photoset_id
    photoset = Flickr.get_photoset_by_id photoset_id
    return "No photoset by the given id" unless photoset
    album = find_or_initialize_by(external_id: photoset.id)
    if !album.publication_date
      album.publication_date = Date.strptime(photoset.date_create, '%s')
    end
    updated_at = DateTime.strptime(photoset.date_update, '%s')
    if album.external_updated_at.nil? || updated_at > album.external_updated_at
      album.external_updated_at = updated_at
      album.title = photoset.title
      album.description = photoset.description
    end
    album.add_or_update_pictures photoset.id, photoset.photos
    album
  end

  def update_from_flickr
    photoset = Flickr.get_photoset_by_id external_id
    return "No Flickr photoset was found" unless photoset
    if !publication_date
      publication_date = Date.strptime(photoset.date_create, '%s')
    end
    updated_at = DateTime.strptime(photoset.date_update, '%s')
    if external_updated_at.nil? || updated_at > external_updated_at
      external_updated_at = updated_at
      title = photoset.title
      description = photoset.description
    end
    added = add_or_update_pictures photoset.id, photoset.photos
    "#{added} photos added from Flickr"
  end

  def add_or_update_pictures photoset_id, total_photos
    existing_photos = photos.count
    page = 1
    per_page = 500
    while(page == 1 || page*per_page <= total_photos) do
      flickr_photos = Flickr.get_photos_for(photoset_id, page)
      next if flickr_photos.nil?
      flickr_photos.photo.each do |photo|
        pic = Photo.find_or_initialize_by(external_id: photo.id)
        last_update = Date.strptime(photo.lastupdate, '%s')
        if pic.external_updated_at != last_update
          photo_info = Flickr.get_photo_info(photo.id)
          next if photo_info.nil?
          pic.title = photo_info.title
          pic.publication_date = Date.parse(photo_info.dates.taken)
          pic.external_updated_at = Date.strptime(photo_info.dates.lastupdate, '%s')
          split_it = photo_info.description.split("Author:")
          pic.description = split_it[0]
          if pic.author.blank?
            # tries to get the author name from description
            pic.author = split_it.size > 1 ? split_it[1] : photo_info.owner.realname
          end
          pic.external_url = photo_info.urls.first["_content"]
          pic.licence = photo_info.license
          if photo_info.tags.any?
            pic.tag_list = photo_info.tags.map{|t| t["raw"]}
          end
          Flickr.get_sizes_for(photo_info.id).each do |size|
            psize = pic.photo_sizes.find_or_initialize_by(label: size.label)
            psize.width = size.width
            psize.height = size.height
            psize.url = size.source
            psize.save
          end
        end
        pic.save
        photos << pic
      end
      page += 1
    end
    save
    photos.count - existing_photos
  end
end
