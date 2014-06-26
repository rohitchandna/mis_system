class BankBooksController < ApplicationController
  # GET /bank_books
  # GET /bank_books.json
  def index
    @bank_books = BankBook.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bank_books }
    end
  end

  # GET /bank_books/1
  # GET /bank_books/1.json
  def show
    @bank_book = BankBook.get(params[:id])

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
    @bank_book = BankBook.new(params[:bank_book])

    respond_to do |format|
      if @bank_book.save
        format.html { redirect_to @bank_book, notice: 'Bank book was successfully created.' }
        format.json { render json: @bank_book, status: :created, location: @bank_book }
      else
        format.html { render action: "new" }
        format.json { render json: @bank_book.errors, status: :unprocessable_entity }
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
end
