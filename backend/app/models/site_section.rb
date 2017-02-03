class SiteSection < ApplicationRecord
  belongs_to :photo

  SECTIONS = ["home", "activities", "publications", "news", "media_library",
              "about"]
  validates :section, uniqueness: true

  class << self
    def site_sections(params, limit)
      query_where = get_filter_condition(params, 'section')

      if query_where.present?
        SiteSection
          .where(query_where, "%#{params[:search]}%")
          .order(:section)
      else
        SiteSection.order(:section).limit(limit)
      end
    end
  end
end
