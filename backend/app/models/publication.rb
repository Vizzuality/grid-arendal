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
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class Publication < Content
  include Attachable::CoverPicture
  include Attachable::Picture
  acts_as_taggable

  has_many :related_contents, dependent: :destroy
  has_many :activities, through: :related_contents
  has_many :documents
  accepts_nested_attributes_for :documents, reject_if: :all_blank,
    allow_destroy: true

  has_many :weblinks, dependent: :destroy
  accepts_nested_attributes_for :weblinks, reject_if: :all_blank,
    allow_destroy: true

  scope :older_pubs, -> { where('EXTRACT(year from content_date) < ?', Date.today.year - 5)}
  scope :filter_or_older_pubs, ->(years) {where('EXTRACT(year from content_date) IN (?) OR EXTRACT(year from content_date) < ?', years, Date.today.year-5)}
  scope :by_years, ->(years) { where('EXTRACT(year from content_date) IN (?)', years) }

  class << self
    def fetch_all(options)
      tags = options['tags'].split(',')               if options['tags'].present?
      type = options['type']                          if options['type'].present?
      partners = options['partners']                  if options['partners'].present?
      status = options['status'] if options['status'].present?
      older = nil
      years = nil
      if options['years'].present?
        years = options['years'].split(',').map(&:to_i)
        if years.include?(-1)
          older = true
          years.delete(-1)
        end
      end

      publications = Publication.by_published.order(content_date: :desc)
      publications = publications.by_tags(tags)   if tags.present?
      publications = publications.by_type(type)   if type.present?
      publications = publications.by_partners(partners)   if partners.present?
      publications = publications.by_status(status)   if status.present?
      if older && years.present?
        publications = publications.filter_or_older_pubs(years)
      elsif years.present?
        publications = publications.by_years(years)
      elsif older
        publications = publications.older_pubs
      end
      publications
    end
  end
end
