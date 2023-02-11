class Public::ReviewsController < ApplicationController
  
  def new
    @review = Review.new
  end
    
  def index
    @reviews = Review.all
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
