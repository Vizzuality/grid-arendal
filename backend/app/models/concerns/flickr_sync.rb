# frozen_string_literal: true
module FlickrSync
  extend ActiveSupport::Concern

  included do

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
      assoc = if self.is_a?(Album)
                :photos
              else
                :graphics
              end
      existing_photos = send(assoc).count
      page = 1
      per_page = 500
      # keep track of photos from flickr
      flickr_photos_ids = []
      while(page == 1 || page*per_page <= total_photos) do
        flickr_photos = Flickr.get_photos_for(photoset_id, page)
        next if flickr_photos.nil?
        flickr_photos.photo.each do |photo|
          pic = send(assoc).find_or_initialize_by(external_id: photo.id)
          flickr_photos_ids << photo.id
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
          send(assoc) << pic
        end
        page += 1
      end
      save
      # remove photos/graphics no longer on flickr
      to_delete = send(assoc).where.not(external_id: flickr_photos_ids)
      to_delete.delete_all unless to_delete.empty?

      send(assoc).count - existing_photos
    end
  end

  class_methods do
    def self.all_sets_from_flickr
      current_total = self.count
      photosets = Flickr.fetch_sets
      photosets.each do |photoset|
        self.create_or_update_set_for(photoset.id)
      end
      self.count - current_total
    end

    def self.create_or_update_set_for photoset_id
      photoset = Flickr.get_photoset_by_id photoset_id
      return "No photoset by the given id" unless photoset
      set = find_or_initialize_by(external_id: photoset.id)
      if !set.publication_date
        set.publication_date = Date.strptime(photoset.date_create, '%s')
      end
      updated_at = DateTime.strptime(photoset.date_update, '%s')
      if set.external_updated_at.nil? || updated_at > set.external_updated_at
        set.external_updated_at = updated_at
        set.title = photoset.title
        set.description = photoset.description
      end
      set.add_or_update_pictures photoset.id, photoset.photos
      set
    end
  end
end
