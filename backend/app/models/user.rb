# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  organization           :string
#  current_position       :string
#  web_url                :string
#  active                 :boolean          default(FALSE), not null
#  deactivated_at         :datetime
#  role                   :integer          default("contributor"), not null
#  locked_at              :datetime
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  is_board_member        :boolean          default(FALSE)
#  phone                  :string
#  description            :text
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  thumbnail_file_name    :string
#  thumbnail_content_type :string
#  thumbnail_file_size    :integer
#  thumbnail_updated_at   :datetime
#  middle_name            :string
#  position_category      :string
#  video_id               :integer
#  facebook_url           :string
#  linkedin_url           :string
#  twitter_url            :string
#  google_url             :string
#  skype_user             :string
#
# Indexes
#
#  index_users_on_current_position      (current_position)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_position_category     (position_category)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  include PgSearch
  enum role: { contributor: 0, publisher: 1, admin: 2 }

  has_many :participants, dependent: :destroy
  has_many :publications, through: :participants, source: :publication
  has_many :activities, through: :participants, source: :activity

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :lockable

  validates :first_name, presence: true

  include Activable
  include Roleable
  include Sanitizable
  include Display
  include Attachable::Avatar
  include Attachable::Thumbnail

  BOARD = "Board Member"
  AFFILIATE = "Honorary Affiliate"
  SPECIAL_CATEGORIES = [BOARD, AFFILIATE]
  STAFF_CATEGORIES = ["Managing Director", "Administration Team",
                         "Finance", "Staff", "Consultants & Interns"]

  POSITION_CATEGORIES = (SPECIAL_CATEGORIES + STAFF_CATEGORIES).sort

  scope :locked_accounts,   -> { where.not(locked_at: nil) }
  scope :order_by_fullname, -> { order(:first_name, :last_name) }
  scope :board_members, -> { where(position_category: BOARD)}
  scope :affiliates, -> { where(position_category: AFFILIATE)}
  scope :regular_staff, -> { where(position_category: STAFF_CATEGORIES)}
  scope :with_category, -> { where.not(position_category: ['', nil])}
  scope :randomize, -> { order('random()') }

  before_update :deactivate_account, if: 'deactivated? && active_changed?'
  before_update :activate_account,   if: 'activated? && active_changed?'
  before_save   :send_invitation,    if: 'activated? && sign_in_count.zero?'

  pg_search_scope :search_for,
    against: {
      first_name: :A,
      middle_name: :A,
      last_name: :A,
      email: :B,
      skype_user: :B,
      twitter_url: :B,
      current_position: :B,
      description: :B
    },
    using: { tsearch: { any_word: false, prefix: true } },
    order_within_rank: 'last_name ASC, first_name ASC'

  def related_publications limit=nil
    sql = <<-SQL
      SELECT * FROM contents
      WHERE type = 'Publication' AND
        is_published = true AND
        (lead_user_id = #{self.id} OR
         id IN (
            SELECT content_id FROM participants WHERE user_id = #{self.id}
          )
        )
      ORDER BY content_date DESC
    SQL
    sql += "limit #{limit}" if limit

    Publication.find_by_sql(sql)
  end

  def related_activities limit=nil
    sql = <<-SQL
      SELECT * FROM contents
      WHERE type = 'Activity' AND
        is_published = true AND
        (lead_user_id = #{self.id} OR
         id IN (
            SELECT content_id FROM participants WHERE user_id = #{self.id}
          )
        )
       ORDER BY CASE
          WHEN status = '#{Content::IN_PROGRESS}'
            THEN 0
          WHEN status = '#{Content::COMPLETED}'
            THEN 1
          WHEN status = '#{Content::IDEAS}'
            THEN 3
          ELSE 4
        END,
        title ASC
    SQL
    sql += "limit #{limit}" if limit

    Activity.find_by_sql(sql)
  end

  class << self
    def filter_users(filters)
      actives   = filters[:active]['true']  if filters[:active].present?
      inactives = filters[:active]['false'] if filters[:active].present?

      users = if actives.present?
                filter_actives
              elsif inactives.present?
                filter_inactives
              else
                all
              end
      users
    end

    def create_with_password(attributes={})
      generated_password = ::Devise.friendly_token.first(8)
      create(attributes.merge(password: generated_password, password_confirmation: generated_password))
    end

    def users(is_admin, user_filters, search, limit)
      user = is_admin ? User.filter_users(user_filters) : User.filter_actives
      if search.present? and search != ''
        user.where("LOWER(first_name) like LOWER(?) OR LOWER(last_name) like LOWER(?) OR LOWER(middle_name) like LOWER(?)",
          "%#{search}%", "%#{search}%", "%#{search}%")
          .order_by_fullname
      else
        user.order_by_fullname.limit(limit)
      end
    end
  end

  private

    def deactivate_account
      unless self.locked_at
        return self.lock_access!
      end
    end

    def activate_account
      if self.locked_at
        return self.unlock_access!
      end
    end

    def send_invitation
      self.send_reset_password_instructions if reset_password_token.blank?
    end
end
