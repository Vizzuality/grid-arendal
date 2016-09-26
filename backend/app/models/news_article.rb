# == Schema Information
#
# Table name: news_articles
#
#  id            :integer          not null, primary key
#  exposure_slug :string
#  title         :string
#  position      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class NewsArticle < ApplicationRecord
  validates :title, presence: true
end
