class Public::CustomersController < ApplicationController
  
  # before_action :is_matching_login_customer
  
  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to public_customer_path(customer.id)
  end

private

  def customer_params
    params.require(:customer).permit(:name, :profile_image)
  end

# idが未定義で上手く動かない
  # def is_matching_login_customer
  #   customer_id = params[:id].to_i
  #   unless customer_id == current_customer.id
  #     redirect_to root_path
  #   end
  # end

end
