class Ability
  include CanCan::Ability

  def initialize(_user)
    user ||= User.new # guest user

    can :manage, :all if user.role? :admin
    can :read, :all
  end
end
