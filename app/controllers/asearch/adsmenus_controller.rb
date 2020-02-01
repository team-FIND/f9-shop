class Asearch::AdsmenusController < ApplicationController
  before_action :set_admenu, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $admenuc = Admenuc.where(:id => params[:adsmenuc_id]).first
    $admenus = $admenuc.admenus.all
    render :layout => "shop/ashop/contents"
  end

  def show
    redirect_to asearch_adsmenu_sdrinks_path(adsmenu_id:$admenuc)
  end

  private

    def set_admenu
      $admenuc = Admenuc.where(:id => params[:adsmenuc_id]).first
      $admenu = $admenuc.admenus.where(:id => params[:id]).first
    end


    def amenu_params
      params.require(:admenu).permit(:admenuc_id, :user_id, :name, :time1, :time2, :time3, :time4)
    end
end
