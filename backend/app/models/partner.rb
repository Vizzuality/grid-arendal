# frozen_string_literal: true
# == Schema Information
#
# Table name: partners
#
#  id                :integer          not null, primary key
#  name              :string
#  web_url           :string
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  logo_file_name    :string
#  logo_content_type :string
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

class Partner < ApplicationRecord
  include Sanitizable
  include Attachable::Logo

  has_many :events

  validates :name, presence: true

  scope :order_by_name, -> { order('name ASC') }
end
