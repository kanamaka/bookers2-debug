class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    else
     render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @booker = Book.find_by(params[:id])
    @comment = @booker.comments
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @users_id = params[:id]
    @user = @book.user
    @comments = @book.comments
    @comment = @book.comments.build
    @comment_id = params[:id]
  end

  def destroy
    @books = Book.find(params[:id])
    @books.destroy
    redirect_to books_path
  end

  def update
    flash[:notice] = "You have updated book successfully."
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end

  def edit
    @book = Book.find(params[:id])
     @book_new = Book.new
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end