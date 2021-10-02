class CommentsController < ApplicationController
def create
 #@book = Book.find(params[:book_id])
 #@comments = Book.comments.includes(:user_id).all
 #@comment  = Book.comments.build(user_id: current_user.id) if current_user
 #redirect_to book_path(@book)
 @book = Book.find(params[:book_id])
 @comment = Comment.comment(@comment.book.id)
 redirect_to book_path(@comment.book.id)
end

def destroy
 #comment.find_by(id: params[:id], book_id: params[:book_id]).destroy
 #redirect_to book_path(params[:book_id])
end

private

def comment_params
 params.require(:comment).permit(:text).marge(user_id: current_user.id, book_id: params[:book.id])
end

end
