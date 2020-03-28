class Fsearch::FssmenucsController < ApplicationController
  before_action :set_fsmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $fshop = Fshop.where(:id => params[:fsshop_id]).first
    $fsmenucs = $fshop.fsmenucs.all
  end

  def show
    $fshop = Fshop.where(:id => params[:fsshop_id]).first
    $fsmenucs = $fshop.fsmenucs.all
    render :layout => "menu_category"
  end

  private

    def set_fsmenuc
      $fshop = Fshop.where(:id => params[:fsshop_id]).first
      $fsmenuc = $fshop.fsmenucs.where(:id => params[:id]).first
    end
    
    def fsmenuc_params
      params.require(:fsmenuc).permit(:fshop_id, :shopname, :user_id, :name, :price, :detail1, :detail2, :detail3, :detail4, :detail5, :detail6, :detail7, :detail8, :detail9, :detail10)
    end
end
