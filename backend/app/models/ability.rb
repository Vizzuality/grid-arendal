# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    if user # devise session users
      if user.admin?
        merge Abilities::AdminUser.new(user)
      elsif user.manager?
        merge Abilities::ManagerUser.new(user)
      else
        merge Abilities::MemberUser.new(user)
      end
    else
      merge Abilities::Guest.new(user)
    end
  end
end
