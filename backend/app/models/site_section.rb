class SiteSection < ApplicationRecord
  belongs_to :photo

  SECTIONS = ["home", "activities", "publications", "news", "media_library",
              "about"]
  validates :section, uniqueness: true
end
