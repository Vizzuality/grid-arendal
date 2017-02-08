# frozen_string_literal: true
class GraphicRequest < ApplicationRecord
  before_create :generate_hash
  belongs_to :media_attachment
  belongs_to :graphic

  validates :media_attachment_id, presence: true
  validates :graphic_id, presence: true

  def display_title
    "By #{name} on #{created_at.strftime("%d/%B/%y")}"
  end

  def graphic_title
    graphic.try(:title)
  end

  def file_name
    media_attachment.try(:document_file_name)
  end

  class << self
    def graphic_requests(params, limit)
      query_where = get_filter_condition(params, 'name')

      if query_where.present?
        GraphicRequest
          .where(query_where, "%#{params[:search]}%")
          .order(created_at: :desc)
      else
        GraphicRequest.order(created_at: :desc).limit(limit)
      end
    end
  end

  private

  def generate_hash
    self[:download_hash] = Digest::MD5.hexdigest(Time.now.getutc.to_s)
  end
end
