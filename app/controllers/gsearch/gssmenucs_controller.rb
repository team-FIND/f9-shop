class Gsearch::GssmenucsController < ApplicationController
  before_action :set_gsmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $gshop = Gshop.where(:id => params[:gsshop_id]).first
    $gsmenucs = $gshop.gsmenucs.all
  end

  def show
    $gshop = Gshop.where(:id => params[:gsshop_id]).first
    $gsmenucs = $gshop.gsmenucs.all
    render :layout => "menu_category"
  end

  private

    def set_gsmenuc
      $gshop = Gshop.where(:id => params[:gsshop_id]).first
      $gsmenuc = $gshop.gsmenucs.where(:id => params[:id]).first
    end
    
    def gsmenuc_params
      params.require(:gsmenuc).permit(:gshop_id, :shopname, :user_id, :name, :price, :detail1, :detail2, :detail3, :detail4, :detail5, :detail6, :detail7, :detail8, :detail9, :detail10)
    end
end
