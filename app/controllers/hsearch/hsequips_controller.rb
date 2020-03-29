class Hsearch::HsequipsController < ApplicationController
    before_action :set_hequip, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $hequipc = Hequipc.where(:id => params[:hsequipc_id]).first
      $hequips = $hequipc.hequips.all
      render :layout => "menu_category"
    end
  
    def show
      $hequipc = Hequipc.where(:id => params[:hsequipc_id]).first
      $hequips = $hequipc.hequips.all
      render :layout => "shop_equip"
    end
  
    private
      def set_hequip
        $hequipc = Hequipc.where(:id => params[:hsequipc_id]).first
        $hequip = $hequipc.hequips.where(:id => params[:id]).first
      end
  
      def hequip_params
        params.require(:hequip).permit(:hequipc_id, :user_id, :equip_img, :equip_img_cache, :name, :explain)
      end
  end
  