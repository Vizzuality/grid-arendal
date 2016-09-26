# frozen_string_literal: true
module Abilities
  class AdminUser
    include CanCan::Ability

    def initialize(user)
      can :read, :all
      can :update, ::User, id: user.id

      if user.activated?
        can :manage, :all
      end

      cannot :make_contributor,        ::User, id: user.id
      cannot :make_publisher,          ::User, id: user.id
      cannot [:activate, :deactivate], ::User, id: user.id
    end
  end
end
