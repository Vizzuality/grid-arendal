# frozen_string_literal: true
module Abilities
  class AdminUser
    include CanCan::Ability

    def initialize(user)
      can :manage, :all

      cannot :make_member,             ::User, id: user.id
      cannot :make_manager,            ::User, id: user.id
      cannot [:activate, :deactivate], ::User, id: user.id
    end
  end
end
