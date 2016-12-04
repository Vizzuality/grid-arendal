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
#  story_map_url        :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class Activity < Content
  has_many :related_contents
  has_many :publications, through: :related_contents

  acts_as_taggable
end
