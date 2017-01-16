# frozen_string_literal: true
# == Schema Information
#
# Table name: contents
#
#  id                   :integer          not null, primary key
#  type                 :string
#  title                :string
#  description          :text
#  is_published         :boolean
#  position             :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class Content < ApplicationRecord
  include Publishable
  include Sanitizable
  include Featurable

  acts_as_taggable

  COMPLETED = "Completed"
  IN_PROGRESS = "In progress"
  IDEAS = "Ideas in development"
  STATUS = [COMPLETED, IDEAS, IN_PROGRESS]

  has_many :participants
  has_many :users, through: :participants
  belongs_to :lead_user, class_name: 'User'

  has_many :content_partners
  has_many :partners, through: :content_partners
  belongs_to :content_type
  belongs_to :media_content

  has_many :content_news
  has_many :news_articles, through: :content_news

  has_many :media_supports
  has_many :media_contents, through: :media_supports

  scope :order_by_title, -> { order('title ASC')        }
  scope :by_published,   -> { where(is_published: true) }
  scope :by_type, ->(type) { where(content_type_id: type) }
  scope :by_tags, ->(tags) { joins(:tags).where(tags: { id: tags }) }
  scope :by_status, ->(status) { where(status: status) }

  validates :title, presence: true
end
