class Public::CommentsController < ApplicationController
  
  def create
    @review = Review.find(params[:review_id])
    comment = Comment.new(comment_params)
    comment.score = Language.get_data(comment_params[:detail])
    comment.customer_id = current_customer.id
    comment.review_id = @review.id
    comment.save  
    @comments = @review.comments.page(params[:page])
  end
  
  def destroy
    Comment.find_by(id: params[:id], review_id: params[:review_id]).destroy
    flash[:notice] = 'コメントを削除しました'
    @review = Review.find(params[:review_id])
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:detail)
  end

  
  
end
