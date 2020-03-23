class Dsearch::DsmenusController < ApplicationController
  before_action :set_dmenu, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $dmenuc = Dmenuc.where(:id => params[:dsmenuc_id]).first
    $dmenus = $dmenuc.dmenus.all
    render :layout => "menu_category"
  end

  def show
    redirect_to dsearch_dsmenu_sautos_path(dsmenu_id:$dmenu)
  end

  private

    def set_dmenu
      $dmenuc = Dmenuc.where(:id => params[:dsmenuc_id]).first
      $dmenu = $dmenuc.dmenus.where(:id => params[:id]).first
    end


    def dmenu_params
      params.require(:dmenu).permit(:dmenuc_id, :user_id, :name)
    end
end
