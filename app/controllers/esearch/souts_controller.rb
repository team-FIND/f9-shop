class Dsearch::SautosController < ApplicationController
  before_action :set_auto, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $dmenu = Dmenu.where(:id => params[:dsmenu_id]).first
    $autos = $dmenu.autos.all
    render :layout => "menu_category"
  end

  def show
    $dmenu = Dmenu.where(:id => params[:dsmenu_id]).first
    $autos = $dmenu.autos.all
    render :layout => "shop/ashop/autos"
  end

  private

    def set_auto
      $dmenu = Dmenu.where(:id => params[:dsmenu_id]).first
      $auto = $dmenu.autos.where(:id => params[:id]).first
    end

    def auto_params
      params.require(:auto).permit(:dmenu_id, :name, :topimg, :topimg_cache, :autoimg1, :autoimg1_cache, :autoimg2, :autoimg2_cache, :autoimg3, :autoimg3_cache, :autoname1, :autoname2, :price)
    end
end
