namespace :import do

  desc "Imports contents of RSS feed"
  task rss: :environment do
    puts "#{NewsArticle.count} articles in the database at the start"
    NewsArticle.fetch_from_rss
    puts "#{NewsArticle.count} articles in the database"
  end
end
