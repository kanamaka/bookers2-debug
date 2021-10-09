class CommentsController < ApplicationController
def create
 @book = Book.find(params[:book_id])
 @comment = current_user.comments.new(comment_params)
 @comment.book_id = @book.id
 if @comment.save
  @comments = @book.comments
 else
  @error_comment = @comment
 end
end

def destroy
 flash[:notice] = "コメントの削除に成功"
 @book = Book.find_by(params[:book_id])
 #@comment = Comment.find_by(book_id: params[:book_id])
 #@comment.destroy
 @comment = Comment.new
 @comments = @book.comments
 Comment.find(params[:id]).destroy
end

private

def comment_params
 params.require(:comment).permit(:comment)
end

end
