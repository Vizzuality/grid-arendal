# frozen_string_literal: true
module Sanitizable
  extend ActiveSupport::Concern

  included do
    before_validation :sanitize_web,       if: "attributes.key?('web_url') || attributes.key?('story_map_url')"
    before_validation :sanitize_last_name, if: "attributes.key?('last_name') && last_name.blank? && first_name.blank?"
  end

  protected

    def sanitize_web
      uri = self.try(:web_url) || self.try(:story_map_url)
      unless uri.blank? || uri.start_with?('http://') || uri.start_with?('https://')
        self.web_url       = "http://#{self.web_url}"       if self.attributes.key?('web_url')
        self.story_map_url = "http://#{self.story_map_url}" if self.attributes.key?('story_map_url')
      end
    end

    def sanitize_last_name
      self.last_name = 'No Name'
    end
end
