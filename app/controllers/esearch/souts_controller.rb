class Esearch::SoutsController < ApplicationController
  before_action :set_out, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $emenu = Emenu.where(:id => params[:esmenu_id]).first
    $outs = $emenu.outs.all
    render :layout => "menu_category"
  end

  def show
    $emenu = Emenu.where(:id => params[:esmenu_id]).first
    $outs = $emenu.outs.all
    render :layout => "shop/ashop/foods"
  end

  private

    def set_out
      $emenu = Emenu.where(:id => params[:esmenu_id]).first
      $out = $emenu.outs.where(:id => params[:id]).first
    end

    def out_params
      params.require(:out).permit(:emenu_id, :name, :topimg, :topimg_cache, :outimg1, :outimg1_cache, :outimg2, :outimg2_cache, :outimg3, :outimg3_cache, :outname1, :outname2, :price)
    end
end
