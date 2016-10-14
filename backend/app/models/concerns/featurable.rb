# frozen_string_literal: true
module Featurable
  extend ActiveSupport::Concern

  included do
    scope :featured,   -> { where(is_featured: true)  }
    scope :not_featured, -> { where(is_featured: false) }

    def make_featured
      update is_featured: true
    end

    def remove_featured
      update is_featured: false
    end

    def not_featured?
      !featured?
    end

    def featured?
      is_featured?
    end

    def publish_status
      is_featured? ? 'featured' : 'not featured'
    end
  end

  class_methods do
  end
end
