# frozen_string_literal: true
module Activable
  extend ActiveSupport::Concern

  included do
    before_save :set_deactivated_at

    before_update :deactivate_dependencies, if: '!active && active_changed?'

    scope :filter_actives,   -> { where(active: true)  }
    scope :filter_inactives, -> { where(active: false) }

    def activate
      update active: true
    end

    def deactivate
      update active: false
    end

    def deactivated?
      !active?
    end

    def activated?
      active?
    end

    def set_deactivated_at
      self.deactivated_at = Time.now if active_changed? && deactivated?
    end

    def status
      active? ? 'admin' : 'staff'
    end

    def deactivate_dependencies
    end
  end

  class_methods do
  end
end
