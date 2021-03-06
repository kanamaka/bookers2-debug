class UsersController < ApplicationController
  before_action :authenticate_user!
  def new
    @user = User.new
    flash[:notice] = "Welcome! You have signed up successfully."
  end

  def create
    flash[:notice] = "You have created book successfully."
    @user = Users.new(users_params)
    @user.users_id = current_users.id
  if @user.save
    redirect_to books_path
  else
     render :create
  end
   current_user.follow(params[:user_id])
   redirect_to request.referer
  end

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @users = User.new
    @comments = @book.comments
  end

  def destroy
    flash[:notice] = "Signed out successfully."
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    current_user.unfollow(params[:user_id])
    redirect_to request.referer  
  end

  def update
    flash[:notice] = "You have updated user successfully."
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id)
    else
     render :edit
    end
  end
  def edit
    @user = User.find(params[:id])
    if @user != current_user
    redirect_to user_path(current_user.id)
    end
  end
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
 
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end