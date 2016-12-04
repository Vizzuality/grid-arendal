# frozen_string_literal: true
# == Schema Information
#
# Table name: news_articles
#
#  id               :integer          not null, primary key
#  exposure_slug    :string
#  title            :string
#  position         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  publication_date :date
#
require 'rss'
require 'open-uri'

class NewsArticle < ApplicationRecord
  has_many :activity_news, dependent: :destroy
  has_many :activities, through: :activity_news

  validates :title, presence: true
  acts_as_taggable

  def self.fetch_from_rss
    existing = NewsArticle.count
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
    NewsArticle.count - existing # articles fetch
  end
end
