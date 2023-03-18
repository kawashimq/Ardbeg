class Public::CommentsController < ApplicationController
  
  def create
    
    @review = Review.find(params[:review_id])
    comment = Comment.new(comment_params)
    comment.score = Language.get_data(comment_params[:detail])
    comment.customer_id = current_customer.id
    comment.review_id = @review.id
    comment.save
    @comments = @review.comments
  end

  def destroy
    Comment.find(params[:id]).destroy
    @comments = Review.find(params[:review_id]).comments
    # flash[:notice] = 'コメントを削除しました'
    render 'public/comments/destroy'
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:detail)
  end

end
