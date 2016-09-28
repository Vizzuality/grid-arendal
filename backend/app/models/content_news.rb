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

class ContentNews < ApplicationRecord

end
