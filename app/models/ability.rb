class Ability
  include CanCan::Ability

  def initialize(user)
    def initialize(user)
      user ||= User.new # guest user

      if user.role? :admin
        can :manage, :all
      end
        can :read, :all
    end  
  end
end