# frozen_string_literal: true
module FlickrService
  class << self
    def set_asset(media_content, options)
      photo_file      = options['photo_file']      if options['photo_file'].present?
      main_photo_file = options['main_photo_file'] if options['main_photo_file'].present?
      title           = options['title']           if options['title'].present?
      description     = options['description']     if options['description'].present?

      if photo_file.present? || main_photo_file.present?
        photo_file ||= main_photo_file
        photo_id   = flickr.upload_photo(photo_file.tempfile.path, title: title, description: description)
        photo_url  = FlickRaw.url_o(flickr.photos.getInfo(photo_id: photo_id))
      end

      if main_photo_file.present?
        photoset = flickr.photosets.create(primary_photo_id: photo_id, title: title, description: description)
        media_content.set_album(photoset_id: photoset.id, photoset_url: photoset.url,
                                main_photo_id: photo_id, main_photo_url: photo_url)
      else
        media_content.set_photo(photo_id: photo_id, photo_url: photo_url)
      end
    end

    def delete_asset(media_content)
      if media_content.is_photo?
        flickr.photos.delete(photo_id: media_content.mediable_id)
      elsif media_content.is_album?
        flickr.photosets.delete(photoset_id: media_content.mediable_id)
      end rescue nil
    end
  end
end
