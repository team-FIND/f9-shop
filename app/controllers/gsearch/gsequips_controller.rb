class Gsearch::GsequipsController < ApplicationController
    before_action :set_gequip, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $gequipc = Gequipc.where(:id => params[:gsequipc_id]).first
      $gequips = $gequipc.gequips.all
      render :layout => "menu_category"
    end
  
    def show
      $gequipc = Gequipc.where(:id => params[:gsequipc_id]).first
      $gequips = $gequipc.gequips.all
      render :layout => "shop_equip"
    end
  
    private
      def set_gequip
        $gequipc = Gequipc.where(:id => params[:gsequipc_id]).first
        $gequip = $gequipc.gequips.where(:id => params[:id]).first
      end
  
      def gequip_params
        params.require(:gequip).permit(:gequipc_id, :user_id, :equip_img, :equip_img_cache, :name, :explain)
      end
  end
  