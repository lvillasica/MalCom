class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new  #guest user (not logged in)
    if user.admin?
     can :manage, :all
    else
      user_role = Role.find_by_id(user.role_id)
      can :create, Project if user_role.can_create_project?
      can :read, Project if user_role.can_read_project?
      can :update, Project if user_role.can_update_project?
      can :destroy, Project if user_role.can_delete_project?
      
      can :create, Ticket if user_role.can_create_ticket?
      can :read, Ticket if user_role.can_read_ticket?
      can :edit, Ticket if user_role.can_read_ticket?
      can :update, Ticket if user_role.can_update_ticket?
      can :destroy, Ticket if user_role.can_delete_ticket?
      
      can :create, Comment if user_role.can_create_comment?
      can :read, Comment if user_role.can_read_comment?
      can :destroy, Comment if user_role.can_delete_comment?
      
      can :create, Tag if user_role.can_create_tag?
      can :read, Tag if user_role.can_read_tag?
      can :update, Tag if user_role.can_update_tag?
      can :destroy, Tag if user_role.can_delete_tag?
      
      can :remove_member, Project if user_role.can_remove_member?
      can :add_member, Project if user_role.can_add_member?
      can :assign, Ticket if user_role.can_assign_ticket?
      
    end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
