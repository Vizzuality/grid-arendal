# frozen_string_literal: true
# == Schema Information
#
# Table name: events
#
#  id                            :integer          not null, primary key
#  title                         :string
#  description                   :text
#  web_url                       :string
#  active                        :boolean          default(FALSE), not null
#  deactivated_at                :datetime
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  background_image_file_name    :string
#  background_image_content_type :string
#  background_image_file_size    :integer
#  background_image_updated_at   :datetime
#

class Event < ApplicationRecord
  include Activable
  include Sanitizable
  include Attachable::BackgroundImage
  include Attachable::CoverPicture

  has_many :event_partners
  has_many :partners, through: :event_partners
  has_many :event_contents, dependent: :destroy
  has_many :activities, through: :event_contents, source: :activity
  has_many :publications, through: :event_contents, source: :publication
  has_many :event_users
  has_many :users, through: :event_users

  acts_as_taggable

  validates :title, presence: true

  scope :order_by_title, -> { order('title ASC') }

  class << self
    def events(params, limit)
      query_where = get_filter_condition(params, 'title')

      if query_where.present?
        Event
          .where(query_where, "%#{params[:search]}%")
          .order(:title)
      else
        Event.order(:title).limit(limit)
      end
    end
  end
end
