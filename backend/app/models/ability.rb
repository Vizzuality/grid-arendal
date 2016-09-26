# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    if user # devise session users
      if user.admin?
        merge Abilities::AdminUser.new(user)
      elsif user.publisher?
        merge Abilities::PublisherUser.new(user)
      else
        merge Abilities::ContributorUser.new(user)
      end
    else
      merge Abilities::Guest.new(user)
    end
  end
end
