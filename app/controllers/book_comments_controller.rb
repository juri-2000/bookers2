class BookCommentsController < ApplicationController
  def create
    # book = BookComment.find(params[:book_id])
    # comment = current_user.book_comments.new(book_comment_params)
    # comment.book_id = book.id
    # comment.save
    # redirect_to book_path(book)
    book_comment = BookComment.new(book_comment_params)
    book_comment.user_id = current_user.id
    # book_comment.book_id = params[:book_id]
    book = Book.find(params[:book_id])
    book_comment.book_id = book.id
    if book_comment.save
     redirect_to book_path(book)
    else
     render :show
    end
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to book_path(params[:book_id])
  end

    private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
