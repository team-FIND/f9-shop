class Esearch::EssmenucsController < ApplicationController
  before_action :set_esmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $eshop = Eshop.where(:id => params[:esshop_id]).first
    $esmenucs = $eshop.esmenucs.all
  end

  def show
    $eshop = Eshop.where(:id => params[:esshop_id]).first
    $esmenucs = $eshop.esmenucs.all
    render :layout => "menu_category"
  end

  private

    def set_esmenuc
      $eshop = Eshop.where(:id => params[:esshop_id]).first
      $esmenuc = $eshop.esmenucs.where(:id => params[:id]).first
    end
    
    def esmenuc_params
      params.require(:esmenuc).permit(:eshop_id, :shopname, :user_id, :name, :price, :detail1, :detail2, :detail3, :detail4, :detail5, :detail6, :detail7, :detail8, :detail9, :detail10)
    end
end
