# frozen_string_literal: true
module FlickrService
  class << self
    def set_asset(media_content, options)
      photo_file      = options['photo_file']              if options['photo_file'].present?
      title           = options['title']                   if options['title'].present?
      description     = options['description']             if options['description'].present?
      album_photos    = options['album_photos_attributes'] if options['album_photos_attributes'].present?

      if photo_file.present?
        photo_id   = flickr.upload_photo(photo_file.tempfile.path, title: title, description: description)
        photo_url  = FlickRaw.url_o(flickr.photos.getInfo(photo_id: photo_id))

        media_content.set_photo(photo_id: photo_id, photo_url: photo_url)
      end

      if album_photos.present?
        album_photo_ids = []
        album_photos.values.each do |album_photo_params|
          album_photo_file  = album_photo_params['photo_file']      if album_photo_params['photo_file'].present?
          photo_title       = album_photo_params['title']           if album_photo_params['title'].present?
          photo_description = album_photo_params['description']     if album_photo_params['description'].present?
          main              = album_photo_params['main_photo_file'] if album_photo_params['main_photo_file'].present?

          album_photo_id  = flickr.upload_photo(album_photo_file.tempfile.path, title: photo_title, description: photo_description)
          album_photo_url = FlickRaw.url_o(flickr.photos.getInfo(photo_id: album_photo_id))
          album_photo_ids << album_photo_id

          album_photo = MediaContent.new(album_photo_params.except(:_destroy, :main_photo_file))
          if album_photo.save
            album_photo.set_photo(photo_id: album_photo_id, photo_url: album_photo_url)
            AlbumRelation.create(photoset_id: media_content.id, album_photo_id: album_photo.id)
          end

          if main.present?
            @photoset = flickr.photosets.create(primary_photo_id: album_photo_id, title: title, description: description)
            media_content.set_album(photoset_id: @photoset.id, photoset_url: @photoset.url,
                                    main_photo_id: album_photo_id, main_photo_url: album_photo_url)
            @main_album_photo_id = album_photo_id
          end
        end
        album_photo_ids = album_photo_ids.join(',')
        flickr.photosets.editPhotos(photoset_id: @photoset.id, primary_photo_id: @main_album_photo_id, photo_ids: album_photo_ids)
      end
    end

    def update_asset(media_content, options)
      photo_file      = options['photo_file']              if options['photo_file'].present?
      photo_id        = options['photo_id']                if options['photo_id'].present?
      photoset_id     = options['photoset_id']             if options['photoset_id'].present?
      title           = options['title']                   if options['title'].present?
      description     = options['description']             if options['description'].present?
      album_photos    = options['album_photos_attributes'] if options['album_photos_attributes'].present?

      if photo_id.present?
        if photo_file.present?
          photo_id  = flickr.replace_photo(photo_file.tempfile.path, photo_id: photo_id)
          photo_url = FlickRaw.url_o(flickr.photos.getInfo(photo_id: photo_id))
          media_content.update_photo(photo_id: photo_id, photo_url: photo_url)
        end
        begin
          flickr.photos.setMeta(photo_id: photo_id, title: title, description: description)
        rescue FlickRaw::FailedResponse
          nil
        end
      end

      if photoset_id.present?
        if album_photos.present?
          album_photos.values.each do |album_photo_params|
            album_photo_file  = album_photo_params['photo_file']      if album_photo_params['photo_file'].present?
            photo_title       = album_photo_params['title']           if album_photo_params['title'].present?
            photo_description = album_photo_params['description']     if album_photo_params['description'].present?
            main              = album_photo_params['main_photo_file'] if album_photo_params['main_photo_file'].present?
            album_photo_id    = album_photo_params['id'].to_i         if album_photo_params['id'].present?

            if album_photo_file.present? && album_photo_id.present?
              if album_photo = MediaContent.find(album_photo_id)
                album_photo_id = album_photo.photo_id
                album_photo_id = flickr.replace_photo(photo_file.tempfile.path, photo_id: album_photo_id)
                album_photo_url = FlickRaw.url_o(flickr.photos.getInfo(photo_id: album_photo_id))
                flickr.photos.setMeta(photo_id: album_photo_id, title: photo_title, description: photo_description)
                album_photo.update_photo(photo_id: album_photo_id, photo_url: album_photo_url)
                album_photo.update(title: photo_title, description: photo_description)
              end
            elsif album_photo_file.present?
              album_photo_id  = flickr.upload_photo(album_photo_file.tempfile.path, title: photo_title, description: photo_description)
              album_photo_url = FlickRaw.url_o(flickr.photos.getInfo(photo_id: album_photo_id))
              album_photo = MediaContent.find(media_content.album_photos.not_photos.pluck(:id).first)
              if album_photo.present?
                album_photo.set_photo(photo_id: album_photo_id, photo_url: album_photo_url)
              end
            else
              if album_photo = MediaContent.find(album_photo_id)
                album_photo_id  = album_photo.photo_id
                album_photo_url = album_photo.photo_url
                flickr.photos.setMeta(photo_id: album_photo_id, title: photo_title, description: photo_description)
                album_photo.update(title: photo_title, description: photo_description)
              end
            end

            if main.present?
              media_content.update_album(main_photo_id: album_photo_id, main_photo_url: album_photo_url)
            end
          end
        end
        begin
          album_photo_ids = media_content.reload.album_photos.map(&:photo_id)
          album_photo_ids = album_photo_ids.join(',')
          flickr.photosets.editMeta(photoset_id: photoset_id, title: title, description: description)
          flickr.photosets.editPhotos(photoset_id: photoset_id, primary_photo_id: media_content.main_photo_id, photo_ids: album_photo_ids)
        rescue FlickRaw::FailedResponse
          nil
        end
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
