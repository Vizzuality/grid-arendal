# frozen_string_literal: true
# == Schema Information
#
# Table name: about_sections
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AboutSection < ApplicationRecord
  validates :title, presence: true
end
