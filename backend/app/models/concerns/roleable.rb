# frozen_string_literal: true
# User Roles: member, publisher, admin
module Roleable
  extend ActiveSupport::Concern

  included do
    scope :admin_users,         -> { where(role: 'admin')       }
    scope :publisher_users,     -> { where(role: 'publisher')     }
    scope :member_users,        -> { where(role: 'member')      }
    scope :not_admin_users,     -> { where.not(role: 'admin')   }
    scope :not_publisher_users, -> { where.not(role: 'publisher') }
    scope :not_member_users,    -> { where.not(role: 'member')  }

    def make_admin
      update(role: 'admin')
    end

    def make_publisher
      update(role: 'publisher')
    end

    def make_contributor
      update(role: 'member')
    end

    def admin?
      role.in?('admin')
    end

    def publisher?
      role.in?('publisher')
    end

    def member?
      role.in?('member')
    end

    def role_name
      case role
      when 'admin'     then I18n.t('shared.admin')
      when 'publisher' then I18n.t('shared.publisher')
      when 'member'    then I18n.t('shared.member')
      else
        I18n.t('shared.user')
      end
    end

  end

  class_methods do
  end
end
