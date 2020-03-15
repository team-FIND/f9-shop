class Csearch::CssmenucsController < ApplicationController
  before_action :set_csmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $cshop = Cshop.where(:id => params[:csshop_id]).first
    $csmenucs = $cshop.csmenucs.all
  end

  def show
    $cshop = Cshop.where(:id => params[:csshop_id]).first
    $csmenucs = $cshop.csmenucs.all
    render :layout => "menu_category"
  end

  private

    def set_csmenuc
      $cshop = Cshop.where(:id => params[:csshop_id]).first
      $csmenuc = $cshop.csmenucs.where(:id => params[:id]).first
    end
    
    def csmenuc_params
      params.require(:csmenuc).permit(:cshop_id, :shopname, :user_id, :name, :price, :detail1, :detail2, :detail3, :detail4, :detail5, :detail6, :detail7, :detail8, :detail9, :detail10)
    end
end
