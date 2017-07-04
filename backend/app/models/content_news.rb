# frozen_string_literal: true
# == Schema Information
#
# Table name: content_news
#
#  id              :integer          not null, primary key
#  content_id      :integer
#  news_article_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Foreign Keys
#
#  fk_rails_64e25041e8  (content_id => contents.id)
#  fk_rails_d89af26c96  (news_article_id => news_articles.id)
#

class ContentNews < ApplicationRecord
  belongs_to :content
  belongs_to :news_article
  belongs_to :activity, foreign_key: :content_id, class_name: 'Activity'
  belongs_to :publication, foreign_key: :content_id, class_name: 'Publication'
end
