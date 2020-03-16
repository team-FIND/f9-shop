class Dsearch::DsmenucsController < ApplicationController
  before_action :set_dmenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $dshop = Dshop.where(:id => params[:dsshop_id]).first
    $dmenucs = $dshop.dmenucs.all
  end

  def show
    redirect_to dsearch_dsmenuc_dsmenus_path(dsmenuc_id:$dmenuc)
  end

  private

    def set_dmenuc
      $dshop = Dshop.where(:id => params[:dsshop_id]).first
      $dmenuc = $dshop.dmenucs.where(:id => params[:id]).first
    end
    
    def dmenuc_params
      params.require(:dmenuc).permit(:dshop_id, :shopname, :user_id, :name)
    end
end
