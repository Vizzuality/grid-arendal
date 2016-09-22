# frozen_string_literal: true
# User Roles: contributor, publisher, admin
module Roleable
  extend ActiveSupport::Concern

  included do
    scope :admin_users,           -> { where(role: 'admin')           }
    scope :publisher_users,       -> { where(role: 'publisher')       }
    scope :contributor_users,     -> { where(role: 'contributor')     }
    scope :not_admin_users,       -> { where.not(role: 'admin')       }
    scope :not_publisher_users,   -> { where.not(role: 'publisher')   }
    scope :not_contributor_users, -> { where.not(role: 'contributor') }

    def make_admin
      update(role: 'admin')
    end

    def make_publisher
      update(role: 'publisher')
    end

    def make_contributor
      update(role: 'contributor')
    end

    def admin?
      role.in?('admin')
    end

    def publisher?
      role.in?('publisher')
    end

    def contributor?
      role.in?('contributor')
    end

    def role_name
      case role
      when 'admin'       then I18n.t('shared.admin')
      when 'publisher'   then I18n.t('shared.publisher')
      when 'contributor' then I18n.t('shared.contributor')
      else
        I18n.t('shared.user')
      end
    end

  end

  class_methods do
  end
end
