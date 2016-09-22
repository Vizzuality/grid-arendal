# frozen_string_literal: true
module Sanitizable
  extend ActiveSupport::Concern

  included do
    before_validation :sanitize_web,       if: "attributes.key?('web_url')"
    before_validation :sanitize_last_name, if: "attributes.key?('last_name') && last_name.blank? && first_name.blank?"
  end

  protected

    def sanitize_web
      unless self.web_url.blank? || self.web_url.start_with?('http://') || self.web_url.start_with?('https://')
        self.web_url = "http://#{self.web_url}"
      end
    end

    def sanitize_last_name
      self.last_name = 'No Name'
    end
end
