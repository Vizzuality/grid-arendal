# frozen_string_literal: true
module Publishable
  extend ActiveSupport::Concern

  included do
    scope :published,   -> { where(is_published: true)  }
    scope :unpublished, -> { where(is_published: false) }

    def publish
      update is_published: true
    end

    def unpublish
      update is_published: false
    end

    def unpublished?
      !published?
    end

    def published?
      is_published?
    end

    def publish_status
      is_published? ? 'published' : 'unpublished'
    end
  end

  class_methods do
  end
end
