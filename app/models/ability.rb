class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    unless user.new_record?
      can :read, HelpRequest
      can :create, HelpRequest, :user => user
      can :read, Response
      can :create, Response, :user => user
      can :read, Word
      can :read, Definition
      can :create, Word, :user => user
      can :create, Definition, :user => user
      can :destroy, Definition, :user => user
    else
      can :read, HelpRequest
      can :read, Response
      can :read, Word
      can :read, Definition
    end
  end
end
