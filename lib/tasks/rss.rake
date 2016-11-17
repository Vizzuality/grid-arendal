require 'rss'
require 'open-uri'

namespace :import do

  desc "Imports contents of RSS feed"
  task rss: :environment do
    puts "#{NewsArticle.count} articles in the database at the start"
    domain = "http://news.grida.no/"
    url = "#{domain}feed.rss"
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      puts "Channel Title: #{feed.channel.title}"
      feed.items.each do |item|
        slug = item.link.gsub(domain, "")
        puts "Item: #{item.title}"
        puts "Slug: #{slug}"
        article = NewsArticle.find_or_initialize_by(exposure_slug: slug)
        article.title = item.title

        html_description = Nokogiri::HTML(item.description)
        article.cover_src = html_description.xpath("//img").attribute("src").value
        article.description = html_description.text
        article.short_description = html_description.text

        article.publication_date = item.pubDate
        article.save
      end
    end
    puts "#{NewsArticle.count} articles in the database"
  end
end
