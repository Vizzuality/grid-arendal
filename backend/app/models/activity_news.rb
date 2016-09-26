# frozen_string_literal: true
# == Schema Information
#
# Table name: activity_news
#
#  id              :integer          not null, primary key
#  activity_id     :integer
#  news_article_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ActivityNews < ApplicationRecord
  belongs_to :activity
  belongs_to :news_article
end
