namespace :import do

  desc "Imports albums from Flickr account"
  task flickr: :environment do
    puts "#{Album.count} albums in the database at the start"
    Album.fetch_from_flickr
    puts "#{Album.count} albums in the database"
  end
end
