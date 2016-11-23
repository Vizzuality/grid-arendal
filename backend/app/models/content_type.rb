# == Schema Information
#
# Table name: content_types
#
#  id          :integer          not null, primary key
#  for_content :string           not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ContentType < ApplicationRecord
end
