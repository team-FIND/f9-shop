class Fsearch::FsmenucsController < ApplicationController
  before_action :set_fmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $fshop = Fshop.where(:id => params[:fsshop_id]).first
    $fmenucs = $fshop.fmenucs.all
  end

  def show
    $fshop = Fshop.where(:id => params[:fsshop_id]).first
    $fmenucs = $fshop.fmenucs.all
    render :layout => "menu_category"
  end

  private

    def set_fmenuc
      $fshop = Fshop.where(:id => params[:fsshop_id]).first
      $fmenuc = $fshop.fmenucs.where(:id => params[:id]).first
    end
    
    def fmenuc_params
      params.require(:fmenuc).permit(:fshop_id, :shopname, :user_id, :name, :content)
    end
end
