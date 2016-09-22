# frozen_string_literal: true
module Abilities
  class ManagerUser
    include CanCan::Ability

    def initialize(user)
      can :read, :all
      can :update, ::User, id: user.id

      if user.activated?
      end

      cannot :make_member,             ::User, id: user.id
      cannot :make_admin,              ::User, id: user.id
      cannot [:activate, :deactivate], ::User, id: user.id
    end
  end
end
