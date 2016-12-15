class SiteSection < ApplicationRecord
  SECTIONS = ["home", "activities", "publications", "news", "media_library",
              "about"]

  validates :section, uniqueness: true
end
