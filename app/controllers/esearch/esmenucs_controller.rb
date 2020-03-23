class Esearch::EsmenucsController < ApplicationController
  before_action :set_emenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $eshop = Eshop.where(:id => params[:esshop_id]).first
    $emenucs = $eshop.emenucs.all
  end

  def show
    redirect_to esearch_esmenuc_esmenus_path(esmenuc_id:$emenuc)
  end

  private

    def set_emenuc
      $eshop = Eshop.where(:id => params[:esshop_id]).first
      $emenuc = $eshop.emenucs.where(:id => params[:id]).first
    end
    
    def emenuc_params
      params.require(:emenuc).permit(:eshop_id, :shopname, :user_id, :name)
    end
end
