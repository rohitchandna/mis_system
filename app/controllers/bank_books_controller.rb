class BankBooksController < ApplicationController
  # GET /bank_books
  # GET /bank_books.json
  

  def index
    redirect_to new_user_session_path, {notice: "Please Log in to view Bank Book"} and return unless current_user

    @bank_books = BankBook.all.accessible_by(current_ability, :index)
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bank_books }
	format.xml 	
    end
  end
  
  # GET /bank_books/1
  # GET /bank_books/1.json
  def show
    
    @bank_book = BankBook.first(:id => params[:id].to_i)
   #  @bank_book = BankBook.get(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bank_book }
    end
  end
  
  # GET /bank_books/new
  # GET /bank_books/new.json
  def new
    @bank_book = BankBook.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bank_book }
    end
  end
  
  # GET /bank_books/1/edit
  def edit
    @bank_book = BankBook.get(params[:id])
  end
  
  # POST /bank_books
  # POST /bank_books.json
  def create

 
    params[:bank_book][:added_by_id] = current_user.id
    params[:bank_book][:added_date] = Time.now    
    params[:bank_book][:created_date] = Date.today    
    params[:bank_book][:branch_id] = current_user.branch.id
    
    #params[:bank_book][:created_date] = Date.today
    # params[:bank_book][:created_time] = Time.now
    #params[:bank_book][:created_by_id] = current_user.id 
   
    
    @bank_book = BankBook.new(params[:bank_book])

    respond_to do |format|

      if @bank_book.save
        format.html { redirect_to bank_books_path, notice: 'Bank book was successfully created.' }
        format.json { render json: @bank_book, status: :created, location: @bank_book }
      else
        
        format.html { render action: "new" }
        format.json { render json: @bank.errors, status: :unprocessable_entity } 
        
      end
    end
  end
  
  # PUT /bank_books/1
  # PUT /bank_books/1.json
  def update
    @bank_book = BankBook.get(params[:id])
    
    respond_to do |format|
      if @bank_book.update(params[:bank_book])
        format.html { redirect_to @bank_book, notice: 'Bank book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bank_book.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /bank_books/1
  # DELETE /bank_books/1.json
  def destroy
    @bank_book = BankBook.get(params[:id])
    @bank_book.destroy
    
    respond_to do |format|
      format.html { redirect_to bank_books_url }
      format.json { head :no_content }
    end
  end
  
  def change_status
    redirect_to new_user_session_path, {notice: "You need to Sign in before continuing."} and return unless current_user
    
    @a = BankBook.first(:id => params[:id].to_i)
    	
    if @a.status.to_s == "not_approved"
      
      @a.update(:status => params[:bank_book][:status], :action_date => Date.today, :action_time => Time.now, :action_by_id => current_user.id)
     	

      if @a.save
        if @a.status.to_s == "approved"
          
          # approve_by_email = @a.email
          # debugger
          # approve_by_name = "#{@a.action_by.first_name} #{@a.action_by.last_name}" 
         end #approved
      end #if  save
      respond_to do |format|
        format.html { redirect_to "/bank_books/#{@a.id}", notice: 'Status Update' }
       
     end 
      
         else 
          respond_to do |format|
           format.html { redirect_to "/bank_books/#{@a.id}", alert: ' Already Approved !' }
        end
   end 
    
  end  


  
  
  
  
  
  def pending_list
    
    
    redirect_to new_user_session_path, {notice: "You need to Sign in before continuing."} and return unless current_user
    if params[:filter_by].to_s == ""
      
      @bank_pending_list = BankBook.all(:conditions => {:status => "not_approved", :branch_id => current_user.branch_id}).accessible_by(current_ability, :index)
      
    else
      @bank_pending_list = BankBook.all(:conditions => {:status => "not_approved", :branch_id => params[:filter_by].to_i}).accessible_by(current_ability, :index)
      end   
    respond_to do |format|
      format.html
      
    end
  end
  def approve_list
    
    redirect_to new_user_session_path, {notice: "You need to Sign in before continuing."} and return unless current_user
    
    if params[:filter_by].to_s == ""  
      @bank_approve_list =BankBook.all(:conditions => {:status => "approved", :branch_id => current_user.branch_id}).accessible_by(current_ability, :index) 
      
    else
      
      @bank_approve_list =BankBook.all(:conditions => {:status => "approved", :branch_id => params[:filter_by].to_i}).accessible_by(current_ability, :index)
      
    end
    respond_to do |format|
      format.html
    end
    
  end
  
  
  def bank_book_action
   
    @bank_book = BankBook.first(:id => params[:id].to_i)
      
  end
  
def tally
@bank_books = BankBook.all.accessible_by(current_ability, :index)
    


end
def reject_list
 redirect_to new_user_session_path, {notice: "You need to Sign in before continuing."} and return unless current_user
    
    if params[:filter_by].to_s == ""  
      @bank_reject_list =BankBook.all(:conditions => {:status => "rejected", :branch_id => current_user.branch_id}).accessible_by(current_ability, :index) 
      
    else
      
      @bank_approve_list =BankBook.all(:conditions => {:status => "rejected", :branch_id => params[:filter_by].to_i}).accessible_by(current_ability, :index)
      
  end
    respond_to do |format|
      format.html
    end
    

end
  
end
