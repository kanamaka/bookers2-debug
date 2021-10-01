class FavoritesController < ApplicationController
  def new
  end
  
  def create
    @favorite = Favorite.create(user_id: current_user.id, book_id: params[:id])
    redirect_to books_path
  end
  
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:id]).destroy
    @favorite.delete
    redirect_to books_path
  end
end
