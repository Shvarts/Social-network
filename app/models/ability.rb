class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role?(:admin)
      can :manage, :all
    else
      can :read, :all 
      can :manage, User do |a|
        a == user
    end

    can :manage, Post do |a|
        a.user == user
    end    

    can :create, Post
    can :create, Asset
    end
  end
  
end