class Admin::ReviewsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    # ページネーションを入れたい
    @q = Review.ransack(params[:q])
    @ransack_reviews = @q.result(distinct: true)
    @reviews = @q.result(distinct: true)
    if params[:production_area_id]
      @production_area = ProductionArea.find(params[:production_area_id])
      @reviews = @production_area.reviews
    end
  end

  def show
    @review = Review.find(params[:id])
    @reviews = Review.all
    @comment = Comment.new
    @comments = Comment.all
  end


  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_reviews_path
  end
end
