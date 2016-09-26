# frozen_string_literal: true
class ContentPartner < ApplicationRecord
  belongs_to :partner
  belongs_to :content
end
