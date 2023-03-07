class Public::InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end
  
  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.save
    redirect_to public_customer_confirm_path
  end

  private
    def inquiry_params
      params.require(:inquiry).permit(:content_inquiry, :email)
    end
end