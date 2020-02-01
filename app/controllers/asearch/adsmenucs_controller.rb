class Asearch::AdsmenucsController < ApplicationController
  before_action :set_admenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $ashop = Ashop.where(:id => params[:assshop_id]).first
    $admenucs = $ashop.admenucs.all
  end

  def show
    redirect_to asearch_adsmenuc_adsmenus_path(adsmenuc_id:$admenuc)
  end

  private

    def set_admenuc
      $ashop = Ashop.where(:id => params[:asshop_id]).first
      $admenuc = $ashop.admenucs.where(:id => params[:id]).first
    end
    
    def admenuc_params
      params.require(:admenuc).permit(:ashop_id, :shopname, :user_id, :name)
    end
end
