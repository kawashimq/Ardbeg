class Admin::ProductionAreasController < ApplicationController
  
def create
  @production_area = ProductionArea.new(production_area_params)
  @production_area.save
  redirect_to admin_production_areas_path
end

def index
  @production_area = ProductionArea.all
end

def edit
  @production_area = ProductionArea.find(params[:id])
end

def update
  @production_area = ProductionArea.find(params[:id])
  @production_area.update(production_area_params)
   flash[:notice] = "ジャンルの更新は成功したよ🙃"
   redirect_to admin_production_areas_path
end

def destroy
  production_area = ProductionArea.find(params[:id])
  production_area.destroy
  redirect_to admin_production_areas_path
end

  private
  def production_area_params
    params.require(:production_area).permit(:genre_name)
  end
end
