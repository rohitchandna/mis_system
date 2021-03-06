class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user
      
      if user.role.to_s == "branch_manager"
        cannot :access, :branches
        can :access, :bank_books, :branch_id => user.branch_id
        
        
        
      elsif user.role.to_s == "account_head"
        can :access, :branches
        can :access, :bank_books
        
      elsif user.role.to_s == "entry_person"  
        
        can :access,  :bank_books, :added_by_id => user.id  

    	elsif user.role.to_s == "admin"
	can :access, :branches
	can :access, :bank_books 	
      
	end
    end
  end
  
end
