class BooksController < ApplicationController

 def index
   @book = Book.new
   @books = Book.all
   @user = current_user
 end
 
 def show
   @book = Book.find(params[:id])
   @post_comment = PostComment.new
 end 
 
 
 def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
  if @book.save
   redirect_to book_path(@book.id)
  else
   render :new
  end
 end 
 
 def edit
  @book = Book.find(params[:id])
 end 
 
 def update
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

end