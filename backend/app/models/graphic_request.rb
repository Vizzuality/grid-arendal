# frozen_string_literal: true
class GraphicRequest < ApplicationRecord
  before_create :generate_hash
  belongs_to :media_attachment

  validates :media_attachment_id, presence: true

  private

  def generate_hash
    self[:download_hash] = Digest::MD5.hexdigest(Time.now.getutc.to_s)
  end
end
