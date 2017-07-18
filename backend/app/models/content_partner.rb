# frozen_string_literal: true
# == Schema Information
#
# Table name: content_partners
#
#  id         :integer          not null, primary key
#  content_id :integer
#  partner_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Foreign Keys
#
#  fk_rails_230224a1f6  (partner_id => partners.id)
#  fk_rails_412ada4abb  (content_id => contents.id)
#

class ContentPartner < ApplicationRecord
  belongs_to :partner
  belongs_to :content
end
