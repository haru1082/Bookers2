class BooksController < ApplicationController

before_action :is_matching_login_user, only: [:edit]

 def index
   @book = Book.new
   @books = Book.all
   @user = current_user
 end
 
 def show
   @new_book = Book.new
   @book = Book.find(params[:id])
 end
 
 
 def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
  if @book.save
   flash[:notice] = "Book was successfully created"
   redirect_to book_path(@book.id)
  else
   @books = Book.all
   @user = current_user
   render :index
  end
 end 
 
 def edit
  @book = Book.find(params[:id])
 end 
 
 def update
      @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully updated"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
 end
 
 def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to '/books'
 end 
  
 private
 
 def book_params
   params.require(:book).permit(:title, :image, :body)
 end 
 
 def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
      redirect_to books_path
    end
 end
 
end