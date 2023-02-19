class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
# .page(params[:page]).per(10)
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
     flash[:notice] = "編集完了"
     redirect_to admin_customers_path
    else
     render:edit
    end
  end
  
  private
    def customer_params
      params.require(:customer).permit(:name, :email, :is_ban)
    end
end
