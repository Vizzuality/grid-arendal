namespace :dropbox do

  desc 'caches dropbox urls'
  task cache_urls: :environment do
    Publication.where.not(picture_file_name: nil).each do |p|
      p.db_medium_picture = p.picture.url(:medium)
      p.db_original_picture = p.picture.url(:original)
      p.save
    end
    Publication.where.not(cover_picture_file_name: nil).each do |p|
      p.db_medium_cover_picture = p.cover_picture.url(:medium)
      p.db_original_cover_picture = p.cover_picture.url(:original)
      p.save
    end
  end
end
