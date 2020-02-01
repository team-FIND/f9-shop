class Asearch::AssmenusController < ApplicationController
  before_action :set_asmenu, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $asmenuc = Asmenuc.where(:id => params[:assmenuc_id]).first
    $asmenus = $asmenuc.asmenus.all
    render :layout => "shop/ashop/contents"
  end

  def show
    $asmenuc = Asmenuc.where(:id => params[:assmenuc_id]).first
    $asmenus = $asmenuc.asmenus.all
    render :layout => "shop/ashop/contents"
  end

  private

    def set_asmenu
      $asmenuc = Asmenuc.where(:id => params[:assmenuc_id]).first
      $asmenu = $asmenuc.asmenus.where(:id => params[:id]).first
    end


    def asmenu_params
      params.require(:asmenu).permit(:asmenuc_id, :user_id, :name, :time1, :time2, :time3, :time4)
    end
end
