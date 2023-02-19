class Admin::CommentsController < ApplicationController
  
  def destroy
    @review = Review.find(params[:review_id])
    Comment.find_by(id: params[:id],review_id: params[:review_id]).destroy
    flash[:notice] = 'コメントを削除しました'
    redirect_to admin_review_path(@review)
  end
  def index
    @comments = Comment.all
  end
end
