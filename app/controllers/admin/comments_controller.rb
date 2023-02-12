class Admin::CommentsController < ApplicationController
  
  def destroy
    Comment.find_by(id: params[:id],review_id: params[:review_id]).destroy
    redirect_to 
  end
  def index
    @comments = Comment.all
  end
end
