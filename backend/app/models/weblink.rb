# frozen_string_literal: true
# == Schema Information
#
# Table name: weblinks
#
#  id         :integer          not null, primary key
#  url        :string
#  label      :string
#  content_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Foreign Keys
#
#  fk_rails_4ea4e9ba6e  (content_id => contents.id)
#

class Weblink < ApplicationRecord
  belongs_to :publication
end
