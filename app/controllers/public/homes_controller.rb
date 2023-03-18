class Public::HomesController < ApplicationController
  
  layout "top_application"
  def top
    @production_areas = ProductionArea.all
    @q = Review.ransack(params[:q])
    @ransack_reviews = @q.result(distinct: true).page(params[:page])
    @reviews = @q.result(distinct: true).page(params[:page])
    @review = Review.find(params[:review_id]) if params[:review_id].present?
    @comment = Comment.new
    if params[:production_area_id]
      @production_area = ProductionArea.find(params[:production_area_id])
      @reviews = @production_area.reviews
    end
    

  end
  
end
