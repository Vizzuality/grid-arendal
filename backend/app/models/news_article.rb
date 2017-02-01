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
  has_many :content_news, dependent: :destroy
  has_many :activities, through: :content_news, source: :activity
  has_many :publications, through: :content_news, source: :publication

  has_many :news_media_contents, dependent: :destroy
  has_many :media_contents, through: :news_media_contents
  has_many :albums, through: :content_news, source: :album
  has_many :photos, through: :content_news, source: :photo

  validates :title, presence: true
  acts_as_taggable

  def self.fetch_from_rss
    existing = NewsArticle.count
    domain = "http://news.grida.no/"
    url = "#{domain}feed.rss?page="
    page = 1
    begin
      rss = open(url+page.to_s)
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
        article.short_description = html_description.text[0, 140]

        article.publication_date = item.pubDate
        article.save
      end
      page += 1
    end while feed.items.any?
    NewsArticle.count - existing # articles fetch
  end

  class << self
    def news_articles(search, limit)
      if search.present? and search != ''
        NewsArticle
          .where("UPPER(title) like UPPER(?)", "%#{search}%")
          .order(publication_date: :desc)
      else
        NewsArticle.order(publication_date: :desc).limit(limit)
      end
    end
  end
end
