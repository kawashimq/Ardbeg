class Public::CommentsController < ApplicationController
  
  def create
    review = Review.find(params[:review_id])
    comment = Comment.new(comment_params)
    comment.customer_id = current_customer.id
    comment.review_id = review.id
    comment.save
    redirect_to public_review_path(review)
  end
  
  def destroy
    @review = Review.find(params[:review_id])
    Comment.find_by(id: params[:id], review_id: params[:review_id]).destroy
    flash[:notice] = 'コメントを削除しました'
    redirect_to public_review_path(@review)
  end
  
  
  private

  def comment_params
    params.require(:comment).permit(:detail)
  end

  
  
end
