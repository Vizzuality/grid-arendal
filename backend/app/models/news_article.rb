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

class NewsArticle < ApplicationRecord
  has_many :activity_news
  has_many :activities, through: :activity_news

  validates :title, presence: true
  acts_as_taggable
end
