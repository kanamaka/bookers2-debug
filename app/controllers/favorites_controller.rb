class FavoritesController < ApplicationController

  def create
    @user = current_user
    @book = Book.find(params[:book_id])
    Favorite.create(user_id: current_user.id, book_id: params[:book_id])
    #@book = Book.find(params[:book_id])
    #@favorite = Current_user.favorite.new(book_id: books.id)
    #@favorite.save
    #redirect_to book_path
    #直前のページは上のやつを使用
    #@like_count
  end
  
  def destroy
    @user = current_user
    @book = Book.find(params[:book_id])
    Favorite.find_by(user_id: current_user.id, book_id: params[:book_id]).destroy
    #render 'destroy.js.erb'
    #@book = Book.find(params[:book_id])
    #@favorite = current_user.favorites.find_by(book_id: book.id)
    #@favorite.destroy
    #redirect_to books_path
    #@like_count
  end
  private

  def book_params
    @book = Book.find(params[:id])
  end
end
