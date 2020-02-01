class Asearch::AsmenucsController < ApplicationController
  before_action :set_amenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $ashop = Ashop.where(:id => params[:asshop_id]).first
    $amenucs = $ashop.amenucs.all
  end

  def show
    redirect_to asearch_asmenuc_asmenus_path(asmenuc_id:$amenuc)
  end

  private

    def set_amenuc
      $ashop = Ashop.where(:id => params[:asshop_id]).first
      $amenuc = $ashop.amenucs.where(:id => params[:id]).first
    end
    
    def amenuc_params
      params.require(:amenuc).permit(:ashop_id, :shopname, :user_id, :name)
    end
end
