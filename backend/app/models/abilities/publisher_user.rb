# frozen_string_literal: true
module Abilities
  class PublisherUser
    include CanCan::Ability

    def initialize(user)
      can :read,   ::User, id: user.id
      can :update, ::User, id: user.id

      if user.activated?
        can :manage, ::Partner
        can :manage, ::AboutSection
        can :manage, ::Event
        can :manage, ::NewsArticle
        can :manage, ::Activity
        can :manage, ::Publication
        can [:publish, :unpublish], ::Activity
        can [:publish, :unpublish], ::Publication
        can [:activate, :deactivate], ::Event
      end

      cannot :make_contributor,        ::User, id: user.id
      cannot :make_admin,              ::User, id: user.id
      cannot [:activate, :deactivate], ::User, id: user.id
    end
  end
end
