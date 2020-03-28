class Hsearch::HssmenucsController < ApplicationController
  before_action :set_hsmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $hshop = Hshop.where(:id => params[:hsshop_id]).first
    $hsmenucs = $hshop.hsmenucs.all
  end

  def show
    $hshop = Hshop.where(:id => params[:hsshop_id]).first
    $hsmenucs = $hshop.hsmenucs.all
    render :layout => "menu_category"
  end

  private

    def set_hsmenuc
      $hshop = Hshop.where(:id => params[:hsshop_id]).first
      $hsmenuc = $hshop.hsmenucs.where(:id => params[:id]).first
    end
    
    def hsmenuc_params
      params.require(:hsmenuc).permit(:hshop_id, :shopname, :user_id, :name, :price, :detail1, :detail2, :detail3, :detail4, :detail5, :detail6, :detail7, :detail8, :detail9, :detail10)
    end
end
