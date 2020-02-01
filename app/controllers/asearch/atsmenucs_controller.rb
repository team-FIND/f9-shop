class Asearch::AtsmenucsController < ApplicationController
  before_action :set_atmenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $ashop = Ashop.where(:id => params[:asshop_id]).first
    $asmenucs = $ashop.atmenucs.all
  end

  def show
    redirect_to asearch_atsmenuc_atsmenus_path(atsmenuc_id:$atmenuc)
  end

  private

    def set_atmenuc
      $ashop = Ashop.where(:id => params[:asshop_id]).first
      $atmenuc = $ashop.atmenucs.where(:id => params[:id]).first
    end
    
    def atmenuc_params
      params.require(:atmenuc).permit(:ashop_id, :shopname, :user_id, :name)
    end
end
