# frozen_string_literal: true
module Abilities
  class AdminUser
    include CanCan::Ability

    def initialize(user)
      can :read,   ::User, id: user.id

      if user.activated?
        can :update, ::User, id: user.id
        can :manage, :all
        can [:activate, :deactivate], ::Event
      end

      cannot :make_contributor,        ::User, id: user.id
      cannot :make_publisher,          ::User, id: user.id
      cannot [:activate, :deactivate], ::User, id: user.id
    end
  end
end
