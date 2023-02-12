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
  end
  
  def update
  end
  
  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to public_reviews_path
  end
  
  
  # 投稿データのストロングパラメータ
  private

  def review_params
    params.require(:review).permit(:item, :image, :content,)
  end
  
end
