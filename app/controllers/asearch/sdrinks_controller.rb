class Asearch::SdrinksController < ApplicationController
  before_action :set_drink, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $admenu = Admenu.where(:id => params[:adsmenu_id]).first
    $drinks = $admenu.drinks.all
    render :layout => "menu_category"
  end

  def show
    $admenu = Admenu.where(:id => params[:adsmenu_id]).first
    $drinks = $admenu.drinks.all
    render :layout => "shop/ashop/foods"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink
      $admenu = Admenu.where(:id => params[:adsmenu_id]).first
      $drink = $admenu.drinks.where(:id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drink_params
      params.require(:drink).permit(:admenu_id, :name, :topimg, :topimg_cache, :foodimg1, :foodimg1_cache, :foodimg2, :foodimg2_cache, :foodimg3, :foodimg3_cache, :foodname1, :foodname2, :price)
    end
end
