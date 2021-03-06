class BankBooksController < ApplicationController
  # GET /bank_books
  # GET /bank_books.json






#load_and_authorize_resource :except => [:new, :create, :update]
  def index
         redirect_to new_user_session_path, {notice: "Please Log in to view Bank Book"} and return unless current_user
    @bank_books = BankBook.all(:order => :action_date.asc).accessible_by(current_ability, :index)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bank_books }
    end
  end
  
  # GET /bank_books/1
  # GET /bank_books/1.json
  def show
    @bank_book = BankBook.first(:id => params[:id].to_i)

        
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
    @bank_book = BankBook.first(params[:id].to_i)    
   
 # @bank_book = BankBook.get(params[:id])
    
  end  
  # POST /bank_books
  # POST /bank_books.json
  def create
       
    params[:bank_book][:added_by_id] = current_user.id
    #params[:bank_book][:branch_id] = params[:id]

    params[:bank_book][:added_date] = Time.now    

    params[:bank_book][:created_date] = Date.today
    params[:bank_book][:created_time] = Time.now
 params[:bank_book][:created_by_id] = current_user.id 
    

    #bb = BankBook.first(:id => params[:id].to_i)


    @bank_book = BankBook.new(params[:bank_book])
    
    respond_to do |format|
      if @bank_book.save
        format.html { redirect_to bank_books_path, notice: 'Bank book was successfully created.' }
        format.json { render json: bank_books_path, status: :created, location: @bank_book }
      else
        
        format.html { render action: "new" }
        format.json { render json: @bank.errors, status: :unprocessable_entity } 
        
      end
    end
  end
  def change_status
    redirect_to new_user_session_path, {notice: "You need to Sign in before continuing."} and return unless current_user
   
    @a = BankBook.first(:id => params[:id].to_i)
   
    if @a == "Not Approved"

      @a.update(:status => params[:bank_book][:status], :action_date => Date.today, :action_time => Time.now, :action_by_id => current_user.id)

else 
end

 
  end
  
  
  # PUT /bank_books/1
  # PUT /bank_books/1.json
  def update
    
    
    respond_to do |format|
      
      if @bank_book.save
        @bank_bookte.update(:update_by_id =>  current_user.id)
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

  def pending_list
    redirect_to new_user_session_path, {notice: "You need to Sign in before continuing."} and return unless current_user
    @bank_pending_list = BankBook.all(:conditions => {:status => "not_approved", :branch_id => params[:filter_by].to_i}).accessible_by(current_ability, :index)


   
    respond_to do |format|
      format.html
    end
  end

  def approve_list
    
    redirect_to new_user_session_path, {notice: "You need to Sign in before continuing."} and return unless current_user
    @bank_approve_list =BankBook.all(:conditions => {:status => "approved", :branch_id => params[:filter_by].to_i}).accessible_by(current_ability, :index)
    
    
    respond_to do |format|
      format.html
    end
    
  end
  

end  


  
