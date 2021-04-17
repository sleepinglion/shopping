class UserAbility
  include CanCan::Ability
  def initialize(user)
    if user
      can :manage, :all
    else
      cannot :manage, :all
    end
  end
end
