namespace :import do
  desc "Imports albums from Flickr account"
  task flickr: :environment do
    puts "#{Album.count} albums in the database at the start"
    Album.fetch_from_flickr
    puts "#{Album.count} albums in the database"
  end

  desc "Upload to flickr! all the things"
  task push_to_flickr: :environment do
    FlickRaw.api_key       = ENV['FLICKR_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_SHARED_SECRET']
    flickr.access_token    = ENV['FLICKR_ACCESS_TOKEN']
    flickr.access_secret   = ENV['FLICKR_ACCESS_SECRET']

    folder = "tmp"
    #files = "downloads"
    ## 0: Id , 1: siteId, 2: Title, 3: Name, 4: UserId, 5: Description,
    ## 6: Link, 7: HasThumb, 8: IsPublished, 9: IsPrivate, 10: ItemCount,
    ## 11: PublishedOn, 12: CreatedOn, 13: CreatedBy, 14: ModifiedOn,
    ## 15: ModifiedBy
    #albums = "albums.csv"
    #albums_it = CSV.read(File.join(Rails.root, folder, albums), headers: true)

    ## 0: Id, 1: siteId, 2: Name, 3: UserId, 4: CollectionId, 5: RefId, 6: Ext,
    ## 7: Title, 8: Description, 9: Source, 10: Link, 11: ProducedOn,
    ## 12: ProducedBy, 13: Type, 14: CopyrightId, 15: CommentCount,
    ## 16: viewCount, 17: DownloadCount, 18: RatingCount, 19: RatingPoints,
    ## 20: RatingStars, 21: IsPublished, 22: ListOrder, 23: CreatedOn,
    ## 24: CreatedBy, 25: ModifiedOn, 26: ModifiedBy
    #photos = "photos.csv"
    #photos_it = CSV.read(File.join(Rails.root, folder, photos), headers: true)

    ## Graphics
    files = "graphics"
    # 0: Id , 1: siteId, 2: Title, 3: Name, 4: UserId, 5: Description,
    # 6: Link, 7: HasThumb, 8: IsPublished, 9: IsPrivate, 10: ItemCount,
    # 11: PublishedOn, 12: CreatedOn, 13: CreatedBy, 14: ModifiedOn,
    # 15: ModifiedBy
    albums = "collections.csv"
    albums_it = CSV.read(File.join(Rails.root, folder, albums), headers: true)

    # 0: Id, 1: siteId, 2: Name, 3: UserId, 4: CollectionId, 5: RefId, 6: Ext,
    # 7: Title, 8: Description, 9: Source, 10: Link, 11: Lat, 12: Lon, 13: RegionISO,
    # 14: ProducedOn, 15: ProducedBy, 16: Type, 17: CopyrightId, 18: CommentCount,
    # 19: ViewCount, 20: DownloadCount, 21: RatingCount, 22: RatingPoints,
    # 23: RatingStars, 24: IsPublished, 25: ListOrder, 26: CreatedOn, 27: CreatedBy,
    # 28: ModifiedOn, 29: ModifiedBy
    photos = "graphics.csv"
    photos_it = CSV.read(File.join(Rails.root, folder, photos), headers: true)

    summary = []

    albums_it.each do |al|
      next if al[0].nil?
      album_photos = photos_it.select{|t| t[4] == al[0]}
      if album_photos.size > 0
        summary << {album: al, photos: album_photos}
      end
    end
    summary.sort!{|a,b| a[:photos].size <=> b[:photos].size}

    directories = Dir.entries(File.join(Rails.root, folder, files))

    do_upload = false
    summary.each do |f|
      al = f[:album]
      if "0cedbc05-2265-4f88-96e3-39393baaaa14" == al[0]
        do_upload = true
        next
      end
      next if !do_upload

      album_photos = f[:photos].sort{|a,b| a[3] <=> b[3]}
      puts "Processing album #{al[0]} - #{al[2]}"
      puts "Description: #{al[5]}"
      puts "Publication Date: #{al[11]}"
      puts "Title: #{al[2]}"
      puts "Number of photos: #{album_photos.size}"

      # Upload the photos first
      photos_ids = []
      primary_photo_id = nil
      i = 0
      album_photos.each do |photo|
        path = File.join(Rails.root, folder, files, photo[5], photo[0]+photo[6])
        if File.exists?(path)
          puts "going to upload the photo with the following details:"
          puts "Name: #{photo[3]}"
          puts "Title: #{photo[7]}"
          puts "Description: #{photo[8]}"
          puts "Author: #{photo[15]}"
          puts photo[14]
          my_date = photo[14].split("/")
          year = my_date[2].split(" ")
          year = year.size == 2 ? "20#{year[0]}" : year[0]
          if year.to_i > 2040
            year = (year.to_i - 100).to_s
          end
          new_date = Date.new(year.to_i, my_date[0].to_i, my_date[1].to_i)
          puts "PublicationDate: #{new_date}"
          description = if photo[15].present?
                          "#{photo[8]}<br />Author: #{photo[15]}"
                        else
                          photo[8]
                        end
          id = nil
          while id == nil do
            begin
              puts "uploading picture #{photo[7]}"
              id = flickr.upload_photo(path, title: photo[7], description: description)
            rescue Exception => e
              puts "Crashed uploading picture.... going to sleep and try again"
              sleep(10)
            end
          end
          photos_ids << id

          response = nil
          while response == nil do
            begin
              response = flickr.photos.setDates(photo_id: id, date_taken: new_date)
            rescue Exception => e
              puts e.message
              puts "Crashed setting dates... going to sleep and will try again"
              sleep(10)
            end
          end

          if primary_photo_id.nil?
            primary_photo_id = id
          end
          puts " ## NEXT PHOTO ## "
          if i == 10
            sleep(10)
            i = 0
          else
            i += 1
          end
        end
      end
      if photos_ids.any?
        puts "I have the following photo_ids for this album: #{photos_ids}"
        photoset = nil
        while photoset == nil do
          begin
            photoset = flickr.photosets.create(primary_photo_id: primary_photo_id,
                                    title: al[2],
                                    description: al[5])
          rescue Exception => e
            puts e.message
            puts "Crashed creating photoset...."
            sleep(10)
          end
        end
        puts "Created this #{photoset.id}"

        edit_photos_result = nil
        while edit_photos_result == nil do
          begin
            edit_photos_result = flickr.photosets.editPhotos(photoset_id: photoset.id,
                                                             primary_photo_id: primary_photo_id,
                                                             photo_ids: photos_ids.join(","))
          rescue Exception => e
            puts e.message
            puts "Crashed setting pictures to album"
            sleep(10)
          end
        end

        puts "Rest a bit before the next album"
        sleep(35)
      end
      puts "###############################"
      puts "###### TO THE NEXT ALBUM ######"
      puts "###############################"
    end
    summary.each do |t|
      puts "#{t[:album][2]} - #{t[:photos].size} photos"
    end
    puts "Total photos: #{summary.inject(0){|sum, t| sum += t[:photos].size}}"
  end
end
