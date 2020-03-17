class Dsearch::DssmenucsController < ApplicationController
  before_action :set_dsmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $dshop = Dshop.where(:id => params[:dsshop_id]).first
    $dsmenucs = $dshop.dsmenucs.all
  end

  def show
    $dshop = Dshop.where(:id => params[:dsshop_id]).first
    $dsmenucs = $dshop.dsmenucs.all
    render :layout => "menu_category"
  end

  private

    def set_dsmenuc
      $dshop = Dshop.where(:id => params[:dsshop_id]).first
      $dsmenuc = $dshop.dsmenucs.where(:id => params[:id]).first
    end
    
    def dsmenuc_params
      params.require(:dsmenuc).permit(:dshop_id, :shopname, :user_id, :name, :price, :detail1, :detail2, :detail3, :detail4, :detail5, :detail6, :detail7, :detail8, :detail9, :detail10)
    end
end
