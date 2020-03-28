class Hsearch::HsmenucsController < ApplicationController
  before_action :set_hmenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $hshop = Hshop.where(:id => params[:hsshop_id]).first
    $hmenucs = $hshop.hmenucs.all
  end

  def show
    redirect_to hsearch_hsmenuc_hsmenus_path(hsmenuc_id:$hmenuc)
  end

  private

    def set_hmenuc
      $hshop = Hshop.where(:id => params[:hsshop_id]).first
      $hmenuc = $hshop.hmenucs.where(:id => params[:id]).first
    end
    
    def hmenuc_params
      params.require(:hmenuc).permit(:hshop_id, :shopname, :user_id, :name)
    end
end
