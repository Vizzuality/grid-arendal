# frozen_string_literal: true
# == Schema Information
#
# Table name: contents
#
#  id                         :integer          not null, primary key
#  type                       :string
#  title                      :string
#  description                :text
#  is_published               :boolean
#  position                   :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  is_featured                :boolean
#  project_number             :integer
#  short_description          :text
#  content_date               :date
#  content_type_id            :integer
#  media_content_id           :integer
#  lead_user_id               :integer
#  picture_file_name          :string
#  picture_content_type       :string
#  picture_file_size          :integer
#  picture_updated_at         :datetime
#  cover_picture_file_name    :string
#  cover_picture_content_type :string
#  cover_picture_file_size    :integer
#  cover_picture_updated_at   :datetime
#  status                     :string
#  programme_id               :integer
#
# Indexes
#
#  index_contents_on_content_type_id   (content_type_id)
#  index_contents_on_media_content_id  (media_content_id)
#
# Foreign Keys
#
#  contents_lead_user_id_fk  (lead_user_id => users.id)
#  fk_rails_3790116d5c       (content_type_id => content_types.id)
#  fk_rails_7839f6a2fb       (media_content_id => media_contents.id)
#  fk_rails_c9694484f9       (programme_id => contents.id)
#

class Publication < Content
  include Attachable::CoverPicture
  acts_as_taggable

  has_many :related_contents, dependent: :destroy
  has_many :activities, through: :related_contents

  scope :by_year, ->(year) { where('EXTRACT(year from content_date) = ?', year) }

  def media_contents_with_graphics_expanded
    media_contents.map do |media|
      if media.type == MediaContent::TYPE_COLLECTION
        media.items
      else
        media
      end
    end.flatten
  end

  class << self
    def fetch_all(options)
      tags = options['tags'].split(',')               if options['tags'].present?
      type = options['type']                          if options['type'].present?
      partners = options['partners']                  if options['partners'].present?
      status = options['status'] if options['status'].present?
      year = options['year'].to_i if options['year'].present?

      publications = Publication.by_published.order(content_date: :desc)
      publications = publications.by_tags(tags)   if tags.present?
      publications = publications.by_type(type)   if type.present?
      publications = publications.by_partners(partners)   if partners.present?
      publications = publications.by_status(status)   if status.present?
      publications = publications.by_year(year) if year.present?
      publications
    end

    def publications(params, limit)
      query_where = get_filter_condition(params, 'title')

      if query_where.present?
        Publication
          .where(query_where, "%#{params[:search]}%")
          .order(content_date: :desc).limit(limit)
      else
        Publication.order(content_date: :desc).limit(limit)
      end
    end
  end
end
