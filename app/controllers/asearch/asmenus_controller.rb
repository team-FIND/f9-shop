class Asearch::AsmenusController < ApplicationController
  before_action :set_amenu, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $amenuc = Amenuc.where(:id => params[:asmenuc_id]).first
    $amenus = $amenuc.amenus.all
    render :layout => "menu_category"
  end

  def show
    redirect_to asearch_asmenu_sfoods_path(asmenu_id:$amenu)
  end

  private

    def set_amenu
      $amenuc = Amenuc.where(:id => params[:asmenuc_id]).first
      $amenu = $amenuc.amenus.where(:id => params[:id]).first
    end


    def amenu_params
      params.require(:amenu).permit(:amenuc_id, :user_id, :name, :time1, :time2, :time3, :time4)
    end
end
