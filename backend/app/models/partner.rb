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

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  validates :name, presence: true
end
