module Flickr
  class << self
    def set_flickr
      FlickRaw.api_key       = ENV['FLICKR_API_KEY']
      FlickRaw.shared_secret = ENV['FLICKR_SHARED_SECRET']
      flickr.access_token    = ENV['FLICKR_ACCESS_TOKEN']
      flickr.access_secret   = ENV['FLICKR_ACCESS_SECRET']
    end

    def fetch_sets
      set_flickr
      photosets = nil
      while photosets.nil? do
        begin
          photosets = flickr.photosets.getList
        rescue FlickRaw::FailedResponse => e
          puts "No photosets"
          return []
        rescue Exception => e
          puts "Failed while trying to fech photosets"
          puts e.message
          sleep(3)
        end
      end
      photosets
    end

    def get_photoset_by_id photoset_id
      set_flickr
      photoset = nil
      while photoset.nil? do
        begin
          photoset = flickr.photosets.getInfo(photoset_id: photoset_id)
        rescue FlickRaw::FailedResponse => e
          puts "No photoset with this id"
          return nil
        rescue Exception => e
          puts "Failed while trying to fech photoset"
          puts e.message
          sleep(2)
        end
      end
      photoset
    end

    def get_photos_for photoset_id, page
      photos = nil
      while photos.nil? do
        begin
          photos = flickr.photosets.getPhotos(photoset_id: photoset_id,
                                              page: page,
                                              extras: "last_update,license,date_taken")
        rescue FlickRaw::FailedResponse => e
          puts "Something wrong with this query, maybe there are no more pages"
          puts e.message
          return nil
        rescue Exception => e
          puts "Failed while fetching pictures, sleeping and retrying"
          sleep(10)
        end
      end
      photos
    end

    def get_photo_info photo_id
      photo_info = nil
      while photo_info.nil? do
        begin
          photo_info = flickr.photos.getInfo(photo_id: photo_id)
        rescue FlickRaw::FailedResponse => e
          puts "Photo doesn't seem to exist, breaking"
          puts e.message
          return nil
        rescue Exception => e
          puts "Failed while fecthing photo info"
          sleep 5
        end
      end
      photo_info
    end

    def get_sizes_for photo_id
      sizes = nil
      while sizes.nil? do
        begin
          sizes = flickr.photos.getSizes(photo_id: photo_id)
        rescue FlickRaw::FailedResponse => e
          puts "Sizes don't exist"
          puts e.message
          return []
        rescue Exception => e
          puts "Failed while fecthing sizes"
          sleep 5
        end
      end
      sizes
    end
  end
end
