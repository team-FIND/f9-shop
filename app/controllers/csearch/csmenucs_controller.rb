class Csearch::CsmenucsController < ApplicationController
  before_action :set_cmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $cshop = Cshop.where(:id => params[:csshop_id]).first
    $cmenucs = $cshop.cmenucs.all
  end

  def show
    $cshop = Cshop.where(:id => params[:csshop_id]).first
    $cmenucs = $cshop.cmenucs.all
    render :layout => "menu_category"
  end

  private

    def set_cmenuc
      $cshop = Cshop.where(:id => params[:csshop_id]).first
      $cmenuc = $cshop.cmenucs.where(:id => params[:id]).first
    end
    
    def cmenuc_params
      params.require(:cmenuc).permit(:cshop_id, :shopname, :user_id, :name, :price, :detail1, :detail2, :detail3, :detail4, :detail5, :detail6, :detail7, :detail8, :detail9, :detail10)
    end
end
