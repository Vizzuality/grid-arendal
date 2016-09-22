# frozen_string_literal: true
module Abilities
  class MemberUser
    include CanCan::Ability

    def initialize(user)
      can :read,   ::User, id: user.id
      can :update, ::User, id: user.id

      if user.activated?
      end

      cannot :make_admin,             ::User, id: user.id
      cannot :make_member,             ::User, id: user.id
      cannot :make_manager,            ::User, id: user.id
      cannot [:activate, :deactivate], ::User, id: user.id
    end
  end
end
