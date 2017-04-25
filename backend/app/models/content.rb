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
  include PgSearch

  acts_as_taggable

  COMPLETED = "Completed"
  IN_PROGRESS = "In progress"
  IDEAS = "Ideas in development"
  STATUS = [COMPLETED, IDEAS, IN_PROGRESS]

  has_many :participants, dependent: :destroy
  has_many :users, through: :participants
  belongs_to :lead_user, class_name: 'User'

  has_many :content_partners, dependent: :destroy
  has_many :partners, through: :content_partners
  belongs_to :content_type
  belongs_to :media_content

  has_many :content_news, dependent: :destroy
  has_many :news_articles, through: :content_news

  has_many :media_supports, dependent: :destroy
  has_many :media_contents, through: :media_supports

  has_many :documents
  accepts_nested_attributes_for :documents, reject_if: :all_blank, allow_destroy: true

  has_many :weblinks, dependent: :destroy
  accepts_nested_attributes_for :weblinks, reject_if: :all_blank, allow_destroy: true

  scope :order_by_title, -> { order('title ASC') }
  scope :order_by_content_date, -> { order(content_date: :desc) }
  scope :by_published,   -> { where(is_published: true) }
  scope :by_type, ->(type) { where(content_type_id: type) }
  scope :by_tags, ->(tags) { joins(:tags).where(tags: { id: tags }) }
  scope :by_status, ->(status) { where(status: status) }
  scope :by_partners, ->(partners) { joins(:content_partners).where(content_partners: {partner_id: partners})}
  scope :by_lead_user, ->(user_id) { where(lead_user: user_id)}

  scope :randomize, -> { order('random()') }

  pg_search_scope :search_for,
    associated_against: { users: { first_name: :B, last_name: :B } },
    against: { title: :A, description: :B },
    using: { tsearch: { any_word: false, prefix: true } },
    order_within_rank: 'updated_at DESC'

  validates :title, presence: true
  validates :status, presence: true

  before_validation :strip_whitespace

  private

  def strip_whitespace
    self.title = self.title.strip if self.title
  end
end
