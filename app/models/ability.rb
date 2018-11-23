class Ability
  include CanCan::Ability

  def initialize(user)
    
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    alias_action(:create, :read, :update, :delete, :edit, :new, to: :crud)

    can(:crud, User) do |this_user|
      user == this_user
    end

    can(:crud, Info) do |info|
      user == info.user
    end
    can(:crud, YogaClass) do |yc|
      user.is_teacher === true  # && user === yc.user
    end

  end
    
end
