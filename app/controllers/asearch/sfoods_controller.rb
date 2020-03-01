class Asearch::SfoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $amenu = Amenu.where(:id => params[:asmenu_id]).first
    $foods = $amenu.foods.all
    render :layout => "menu_category"
  end

  def show
    $amenu = Amenu.where(:id => params[:asmenu_id]).first
    $foods = $amenu.foods.all
    render :layout => "shop/ashop/foods"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      $amenu = Amenu.where(:id => params[:asmenu_id]).first
      $food = $amenu.foods.where(:id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:amenu_id, :name, :topimg, :topimg_cache, :foodimg1, :foodimg1_cache, :foodimg2, :foodimg2_cache, :foodimg3, :foodimg3_cache, :foodname1, :foodname2, :price)
    end
end
