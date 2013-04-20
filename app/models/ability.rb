class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    unless user.new_record?
      can :read, HelpRequest
      can [:create, :update], HelpRequest, :user => user
      can :read, Response
      can :create, Response, :user => user

      can [:create, :read], Word
      can [:create, :read], Definition
      can :destroy, Definition, :user => user

      can [:read, :create], Tool
      can [:read, :create], Type
      can [:read, :create], Subject
      can :manage, Goal, :user => user
    else
      can :read, HelpRequest
      can :read, Response
      can :read, Word
      can :read, Definition
      can :read, Tool
      can :read, Type
      can :read, Subject
    end
  end
end
