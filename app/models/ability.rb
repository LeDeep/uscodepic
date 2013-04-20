class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    unless user.new_record?
      can :read, HelpRequest
      can [:create, :update], HelpRequest, :user => user
      can :read, Response
      can :create, Response, :user => user 
      #cannot :create, Response, :help_request => {:closed => true}
      # can :create, Response if :user => user unless :help_request => {:closed => true} end

      can [:create, :read, :update], Story, :user => user
      can [:create, :read, :destroy, :update], Comment, :user => user

      can [:create], Word, :user => user
      can [:read], Word
      can [:read], Definition
      can [:create, :destroy, :update], Definition, :user => user

      can [:read, :create], Tool
      can [:read, :create], Type
      can [:read, :create], Subject
    else
      can :read, HelpRequest
      can :read, Response
      can :read, Word
      can :read, Definition
      can :read, Story
      can :read, Comment
      can :read, Tool
      can :read, Type
      can :read, Subject
    end
  end
end
