class Public::ReviewsController < ApplicationController
  
  before_action :search
  def new
    @review = Review.new
  end
    
  def search
    @q = Review.ransack(params[:q])
    @reviews = @q.result(distinct: true)
  end
  
  def index
    @q = Review.ransack(params[:q])
    @ransack_reviews = @q.result(distinct: true)
    @reviews = @q.result(distinct: true)
    if params[:production_area_id]
      @production_area = ProductionArea.find(params[:production_area_id])
      @reviews = @production_area.reviews
    end 
  end
  
  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.save
    redirect_to public_reviews_path
  end
  
  def show
    @review = Review.find(params[:id])
    @reviews = Review.all
    @comment = Comment.new
    @comments = Comment.all
  end
  
  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
      flash[:notice] = "編集完了"
      redirect_to public_review_path(@review.id)
  end
  
  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to public_reviews_path
  end
  
  
  # 投稿データのストロングパラメータ
  private

  def review_params
    params.require(:review).permit(:item, :image, :content, :production_area_id)
  end
  
end
