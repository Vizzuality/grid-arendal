class SiteSection < ApplicationRecord
  belongs_to :photo

  SECTIONS = ["home", "activities", "publications", "news", "media_library",
              "about"]
  validates :section, uniqueness: true

  class << self
    def site_sections(search, limit)
      if search.present? and search != ''
        SiteSection
          .where("UPPER(section) like UPPER(?)", "%#{search}%")
          .order(:section)
      else
        SiteSection.order(:section).limit(limit)
      end
    end
  end
end
