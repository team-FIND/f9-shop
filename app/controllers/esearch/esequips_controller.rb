class Esearch::EsequipsController < ApplicationController
    before_action :set_eequip, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $eequipc = Eequipc.where(:id => params[:esequipc_id]).first
      $eequips = $eequipc.eequips.all
      render :layout => "menu_category"
    end
  
    def show
      $eequipc = Eequipc.where(:id => params[:esequipc_id]).first
      $eequips = $eequipc.eequips.all
      render :layout => "shop_equip"
    end
  
    private
      def set_eequip
        $eequipc = Eequipc.where(:id => params[:esequipc_id]).first
        $eequip = $eequipc.eequips.where(:id => params[:id]).first
      end
  
      def eequip_params
        params.require(:eequip).permit(:eequipc_id, :user_id, :equip_img, :equip_img_cache, :name, :explain)
      end
  end
  