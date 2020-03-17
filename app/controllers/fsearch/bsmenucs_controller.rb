class Bsearch::BsmenucsController < ApplicationController
  before_action :set_bmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $bshop = Bshop.where(:id => params[:bsshop_id]).first
    $bmenucs = $bshop.bmenucs.all
  end

  def show
    $bshop = Bshop.where(:id => params[:bsshop_id]).first
    $bmenucs = $bshop.bmenucs.all
    render :layout => "menu_category"
  end

  private

    def set_bmenuc
      $bshop = Bshop.where(:id => params[:bsshop_id]).first
      $bmenuc = $bshop.bmenucs.where(:id => params[:id]).first
    end
    
    def bmenuc_params
      params.require(:bmenuc).permit(:bshop_id, :shopname, :user_id, :name, :content)
    end
end
