class Asearch::AssmenucsController < ApplicationController
  before_action :set_asmenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $ashop = Ashop.where(:id => params[:asshop_id]).first
    $asmenucs = $ashop.asmenucs.all
  end

  def show
    redirect_to asearch_assmenuc_assmenus_path(assmenuc_id:$asmenuc)
  end
  
  private

    def set_asmenuc
      $ashop = Ashop.where(:id => params[:asshop_id]).first
      $asmenuc = $ashop.asmenucs.where(:id => params[:id]).first
    end
    
    def asmenuc_params
      params.require(:asmenuc).permit(:ashop_id, :shopname, :user_id, :name)
    end
end
