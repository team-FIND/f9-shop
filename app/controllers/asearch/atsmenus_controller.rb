class Asearch::AtsmenusController < ApplicationController
  before_action :set_atmenu, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $atmenuc = Atmenuc.where(:id => params[:atsmenuc_id]).first
    $atmenus = $atmenuc.atmenus.all
    render :layout => "menu_category"
  end

  def show
    redirect_to asearch_atsmenu_astakeouts_path(atsmenu_id:$atmenu)
  end

  private

    def set_atmenu
      $atmenuc = Atmenuc.where(:id => params[:atsmenuc_id]).first
      $atmenu = $atmenuc.atmenus.where(:id => params[:id]).first
    end


    def atmenu_params
      params.require(:atmenu).permit(:atmenuc_id, :user_id, :name, :time1, :time2, :time3, :time4)
    end
end
