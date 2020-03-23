class Esearch::EsmenusController < ApplicationController
  before_action :set_emenu, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $emenuc = Emenuc.where(:id => params[:esmenuc_id]).first
    $emenus = $emenuc.emenus.all
    render :layout => "menu_category"
  end

  def show
    redirect_to esearch_esmenu_souts_path(esmenu_id:$emenu)
  end

  private

    def set_emenu
      $emenuc = Emenuc.where(:id => params[:esmenuc_id]).first
      $emenu = $emenuc.emenus.where(:id => params[:id]).first
    end


    def emenu_params
      params.require(:emenu).permit(:emenuc_id, :user_id, :name)
    end
end
