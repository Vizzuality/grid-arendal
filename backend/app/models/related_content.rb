# frozen_string_literal: true
# == Schema Information
#
# Table name: related_contents
#
#  id             :integer          not null, primary key
#  activity_id    :integer
#  publication_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_related_contents_on_activity_id     (activity_id)
#  index_related_contents_on_publication_id  (publication_id)
#
# Foreign Keys
#
#  fk_rails_d4f5c2da33  (activity_id => contents.id)
#  fk_rails_f7517c2200  (publication_id => contents.id)
#

class RelatedContent < ApplicationRecord
  belongs_to :activity
  belongs_to :publication
end
