class CommentsController < ApplicationController
def create
 @book = Book.find(params[:book_id])
 @comment = current_user.comments.new(comment_params)
 @comment.book_id = @book.id
 if @comment.save
  create.js
 else
  @error_comment = @comment
 end
end

def destroy
 flash[:notice] = "コメントの削除に成功"
 @book = Book.find(params[:book_id])
 @comment = current_user.comments.find_by(book_id: @book.id)
 @Comment.destroy
end

private

def comment_params
 params.require(:comment).permit(:comment)
end

end
