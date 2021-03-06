class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    unless user.new_record?
      can :read, HelpRequest
      can [:create, :update], HelpRequest, :user => user
      can :read, Response
      can :create, Response, :user => user

      can :read, Word
      can :read, Definition
      can :create, Word
      can :create, Definition, :user => user
      can :destroy, Definition, :user => user
      can :update, Definition

      can :manage, Tool
      can [:read, :create], Type
      can [:read, :create, :destroy], Subject #change to only read & create after making edits on Heroku
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
