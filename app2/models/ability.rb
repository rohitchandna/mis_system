class Ability
  include CanCan::Ability

  def initialize(user)

    if user
      
      if user.role.to_s == "branch_manager"
        cannot :access, :branches
        can :access, :bank_books
        
        
      elsif user.role.to_s == "account_head"
        can :access, :branches
        can :access, :bank_books
    
      elsif user.role.to_s == "entry_person"  
        can [:read, :create], :bank_book, {:entry_person_id => user.id, :branch_id => user.branch.id }
        
      elsif user.role.to_s == "admin"
        can :access, :branches
        can :access, :bank_books
        
        
    
      end
    end
  end
  
end
