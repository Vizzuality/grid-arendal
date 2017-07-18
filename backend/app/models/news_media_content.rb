# frozen_string_literal: true
# == Schema Information
#
# Table name: news_media_contents
#
#  id               :integer          not null, primary key
#  news_article_id  :integer
#  media_content_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_news_media_contents_on_media_content_id  (media_content_id)
#  index_news_media_contents_on_news_article_id   (news_article_id)
#
# Foreign Keys
#
#  fk_rails_66a28af0cd  (media_content_id => media_contents.id)
#  fk_rails_f5b1f9cd1d  (news_article_id => news_articles.id)
#

class NewsMediaContent < ApplicationRecord
  belongs_to :news_article
  belongs_to :media_content
  belongs_to :album, foreign_key: :media_content_id, class_name: 'Album'
  belongs_to :photo, foreign_key: :media_content_id, class_name: 'Photo'
end
