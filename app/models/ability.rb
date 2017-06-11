class Ability
  include CanCan::Ability

  def initialize(model)
    case model
      when Admin
        admin = Admin.last
        if admin.superadmin?
          can :manage, :all
        elsif admin.admin?
          can :manage, User
        elsif admin.member?
          can :update, Complaint
          can :read, :all
        end
      when User
        can :manage, Complaint
        can :manage, User
        can :manage, Verification
    end
  end
end

