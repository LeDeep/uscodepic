class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    unless user.new_record?
      can :manage, :all
    else
      can :read, HelpRequest
      can :create, HelpRequest, :user => user
      can :read, Response
      can :create, Response, :user => user
      can [:create, :read], Word
      can [:create, :read], Definition
      can :destroy, Definition, :user => user
    end
  end
end
