# frozen_string_literal: true
module Abilities
  class PublisherUser
    include CanCan::Ability

    def initialize(user)
      can :read, :all
      can :update, ::User, id: user.id

      if user.activated?
        can :manage, ::Partner
        can :manage, ::AboutSection
        can :manage, ::NewsArticle
        can :manage, ::Event
        can [:activate, :deactivate], ::Event
      end

      cannot :make_contributor,        ::User, id: user.id
      cannot :make_admin,              ::User, id: user.id
      cannot [:activate, :deactivate], ::User, id: user.id
    end
  end
end
