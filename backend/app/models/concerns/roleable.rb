# frozen_string_literal: true
# User Roles: member, manager, admin
module Roleable
  extend ActiveSupport::Concern

  included do
    scope :admin_users,       -> { where(role: 'admin')       }
    scope :manager_users,     -> { where(role: 'manager')     }
    scope :member_users,      -> { where(role: 'member')      }
    scope :not_admin_users,   -> { where.not(role: 'admin')   }
    scope :not_manager_users, -> { where.not(role: 'manager') }
    scope :not_member_users,  -> { where.not(role: 'member')  }

    def make_admin
      update(role: 'admin')
    end

    def make_manager
      update(role: 'manager')
    end

    def make_member
      update(role: 'member')
    end

    def admin?
      role.in?('admin')
    end

    def manager?
      role.in?('manager')
    end

    def member?
      role.in?('member')
    end

    def role_name
      case role
      when 'admin'   then I18n.t('shared.admin')
      when 'manager' then I18n.t('shared.manager')
      when 'member'  then I18n.t('shared.member')
      else
        I18n.t('shared.user')
      end
    end

  end

  class_methods do
  end
end
