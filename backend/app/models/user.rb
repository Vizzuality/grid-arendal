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
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  enum role: { contributor: 0, publisher: 1, admin: 2 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :lockable

  include Activable
  include Roleable
  include Sanitizable
  include Display

  if ENV['DROPBOX_APP_KEY'].present?
    has_attached_file :avatar,
                      styles: { medium: '300x300>', thumb: '100x100>' },
                      default_url: '/images/:style/missing.png',
                      storage: :dropbox,
                      dropbox_credentials: Rails.root.join('config/dropbox.yml'),
                      dropbox_options: {
                        path: proc { |style| "#{Rails.env}/#{style}/#{id}_#{avatar.original_filename}"},
                        unique_filename: true
                      }
  else
    has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },
                               default_url: '/images/:style/missing.png'
  end

  validates_attachment_content_type :avatar, content_type: /\Aimage/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/,/gif\Z/,/PNG\Z/, /JPE?G\Z/,/GIF\Z/]

  before_update :deactivate_account, if: 'deactivated? && active_changed?'
  before_update :activate_account,   if: 'activated? && active_changed?'
  before_save   :send_invitation,    if: 'activated? && sign_in_count.zero?'

  scope :locked_accounts, -> { where.not(locked_at: nil) }

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
