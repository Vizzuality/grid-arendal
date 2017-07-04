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

class Activity < Content
  has_many :related_contents, dependent: :destroy
  has_many :publications, through: :related_contents
  belongs_to :programme, class_name: 'Activity'
  has_many :programme_activities, class_name: 'Activity', foreign_key: 'programme_id'

  scope :programmes, -> {joins(:content_type).where(content_types: {title: ContentType::PROGRAMME}).published.order(:title)}
  scope :by_programme, ->(programme) {where("contents.programme_id = ? OR contents.id = ?", programme, programme)}

  acts_as_taggable

  def is_programme?
    content_type && content_type.title == ContentType::PROGRAMME
  end

  class << self
    def fetch_all(options)
      tags = options['tags'].split(',')               if options['tags'].present?
      type = options['type']                          if options['type'].present?
      partners = options['partners']                  if options['partners'].present?
      programme = options['programme'] if options['programme'].present?
      status = options['status'] if options['status'].present?

      activities = Activity.by_published.order_by_status_and_title
      activities = activities.by_tags(tags)   if tags.present?
      activities = activities.by_type(type)   if type.present?
      activities = activities.by_partners(partners)   if partners.present?
      activities = activities.by_programme(programme) if programme.present?
      activities = activities.by_status(status)   if status.present?
      activities
    end

    def activities(params, limit)
      query_where = get_filter_condition(params, 'title')

      if query_where.present?
        Activity
          .where(query_where, "%#{params[:search]}%")
          .order(:title).limit(limit)
      else
        Activity.order(:title).limit(limit)
      end
    end

    def order_by_status_and_title
      c = ContentType.where(title: ContentType::PROGRAMME).first
      sql = <<-SQL
        CASE
          #{ if c then "WHEN content_type_id = #{c.id} THEN 0" end}
          WHEN status = '#{Content::IN_PROGRESS}'
            THEN 1
          WHEN status = '#{Content::COMPLETED}'
            THEN 2
          WHEN status = '#{Content::IDEAS}'
            THEN 3
          ELSE 4
        END ASC,
        RANDOM()
      SQL
      order(sql)
    end
  end
end
