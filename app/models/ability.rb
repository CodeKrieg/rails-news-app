class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
       can :read, Article
       can :manage, :all if user.role == "admin"
       can :manage, Article if user.role == "author"
   end
end
