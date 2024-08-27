class BooksController < ApplicationController

 def index
   @books = Book.all
 end
 
 def show
   @book = Book.find(params[:id])
   @post_comment = PostComment.new
 end 
 
 
 def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   @book.save
   redirect_to book_path
 end 
 
 def edit
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
   params.require(:book).permit(:shop_name, :image, :caption)
 end 

end