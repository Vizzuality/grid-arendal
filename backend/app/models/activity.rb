# frozen_string_literal: true
class Activity < Content
  has_many :activity_news
  has_many :news_articles, through: :activity_news
end
