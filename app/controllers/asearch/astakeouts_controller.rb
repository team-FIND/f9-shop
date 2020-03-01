class Asearch::AstakeoutsController < ApplicationController
  before_action :set_atakeout, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $atmenu = Atmenu.where(:id => params[:atsmenu_id]).first
    $atakeouts = $atmenu.atakeouts.all
    render :layout => "menu_category"
  end

  def show
    $atmenu = Atmenu.where(:id => params[:atsmenu_id]).first
    $takeouts = $atmenu.atakeouts.all
    render :layout => "shop/ashop/foods"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atakeout
      $atmenu = Atmenu.where(:id => params[:atsmenu_id]).first
      $atakeout = $atmenu.atakeouts.where(:id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atakeout_params
      params.require(:atakeout).permit(:atmenu_id, :name, :topimg, :topimg_cache, :foodimg1, :foodimg1_cache, :foodimg2, :foodimg2_cache, :foodimg3, :foodimg3_cache, :foodname1, :foodname2, :price)
    end
end
