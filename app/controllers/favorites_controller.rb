class FavoritesController < ApplicationController
  def create
    Favorite.create(user_id: current_user.id, book_id: params[:book_id])
    @book = Book.find(params[:book_id])
    #@favorite = Current_user.favorite.new(book_id: books.id)
    #@favorite.save
    #直前のページは上のやつを使用
    #@like_count
  end
  
  def destroy
    Favorite.find_by(user_id: current_user.id, book_id: params[:book_id]).destroy
    @book = Book.find(params[:book_id])
    #@favorite = current_user.favorites.find_by(book_id: book.id)
    #@favorite.destroy
    #@like_count
  end
  private

  def book_params
    @book = Book.find(params[:id])
  end
end
