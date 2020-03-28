class Hsearch::HsmenusController < ApplicationController
  before_action :set_hmenu, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $hmenuc = Hmenuc.where(:id => params[:hsmenuc_id]).first
    $hmenus = $hmenuc.hmenus.all
    render :layout => "menu_category"
  end

  def show
    redirect_to hsearch_hsmenu_sitems_path(hsmenu_id:$hmenu)
  end

  private

    def set_hmenu
      $hmenuc = Hmenuc.where(:id => params[:hsmenuc_id]).first
      $hmenu = $hmenuc.hmenus.where(:id => params[:id]).first
    end

    def hmenu_params
      params.require(:hmenu).permit(:hmenuc_id, :user_id, :name)
    end
end
