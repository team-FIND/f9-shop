class Gsearch::GsmenucsController < ApplicationController
  before_action :set_gmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $gshop = Gshop.where(:id => params[:gsshop_id]).first
    $gmenucs = $gshop.gmenucs.all
  end

  def show
    $gshop = Gshop.where(:id => params[:gsshop_id]).first
    $gmenucs = $gshop.gmenucs.all
    render :layout => "menu_category"
  end

  private

    def set_gmenuc
      $gshop = Gshop.where(:id => params[:gsshop_id]).first
      $gmenuc = $gshop.gmenucs.where(:id => params[:id]).first
    end
    
    def gmenuc_params
      params.require(:gmenuc).permit(:gshop_id, :shopname, :user_id, :name, :content)
    end
end
