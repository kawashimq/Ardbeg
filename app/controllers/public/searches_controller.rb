class Public::SearchesController < ApplicationController
  
  def search
    @range = params[:range]

    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word])
    else
      @production_area = ProductionArea.looks(params[:search], params[:word])
    end
  end
end
