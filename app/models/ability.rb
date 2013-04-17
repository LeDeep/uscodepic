class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    unless user.new_record?
      can :read, HelpRequest
      can :create, HelpRequest, :user => user
      can :read, Response
      can :create, Response, :user => user
    else
      can :read, HelpRequest
      can :read, Response
    end
  end
end
