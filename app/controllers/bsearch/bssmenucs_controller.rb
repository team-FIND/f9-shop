class Bsearch::BssmenucsController < ApplicationController
  before_action :set_bsmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $bshop = Bshop.where(:id => params[:bsshop_id]).first
    $bsmenucs = $bshop.bsmenucs.all
  end

  def show
    $bshop = Bshop.where(:id => params[:bsshop_id]).first
    $bsmenucs = $bshop.bsmenucs.all
    render :layout => "shop/ashop/contents"
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_bsmenuc
      $bshop = Bshop.where(:id => params[:bsshop_id]).first
      $bsmenuc = $bshop.bsmenucs.where(:id => params[:id]).first
    end
    
    def bsmenuc_params
      params.require(:bsmenuc).permit(:bshop_id, :shopname, :user_id, :name, :price, :detail1, :detail2, :detail3, :detail4, :detail5, :detail6, :detail7, :detail8, :detail9, :detail10)
    end
end
