class CommentsController < ApplicationController
def create
 flash[:notice] = "コメントの投稿に成功"
 @book = Book.find(params[:book_id])
 @comment = current_user.comments.new(comment_params)
 @comment.book_id = @book.id
 @comment.save
 redirect_to book_path(@book)
end

def destroy
 flash[:notice] = "コメントの削除に成功"
 #@book = Book.find(params[:book_id])
 #@comment = Comment.find_by(book_id: params[:book_id])
 #@comment.destroy
 Comment.find_by(params[:id]).destroy
 redirect_back(fallback_location: root_path)
end

private

def comment_params
 params.require(:comment).permit(:comment)
end

end
