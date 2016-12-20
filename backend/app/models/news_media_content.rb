# frozen_string_literal: true
class NewsMediaContent < ApplicationRecord
  belongs_to :news_article
  belongs_to :media_content
  belongs_to :album, foreign_key: :media_content_id, class_name: 'Album'
  belongs_to :photo, foreign_key: :media_content_id, class_name: 'Photo'
end
