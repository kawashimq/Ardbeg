class Public::HomesController < ApplicationController
  def top
    @production_areas = ProductionArea.all
    @q = Review.ransack(params[:q])
    @ransack_reviews = @q.result(distinct: true)
    @reviews = @q.result(distinct: true)
    if params[:production_area_id]
      @production_area = ProductionArea.find(params[:production_area_id])
      @reviews = @production_area.reviews
    end
  end
  

end
