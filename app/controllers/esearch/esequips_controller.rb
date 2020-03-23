class Dsearch::DsequipsController < ApplicationController
    before_action :set_dequip, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $dequipc = Dequipc.where(:id => params[:dsequipc_id]).first
      $dequips = $dequipc.dequips.all
      render :layout => "menu_category"
    end
  
    def show
      $dequipc = Dequipc.where(:id => params[:dsequipc_id]).first
      $dequips = $dequipc.dequips.all
      render :layout => "shop_equip"
    end
  
    private
      def set_dequip
        $dequipc = Dequipc.where(:id => params[:dsequipc_id]).first
        $dequip = $dequipc.dequips.where(:id => params[:id]).first
      end
  
      def dequip_params
        params.require(:dequip).permit(:dequipc_id, :user_id, :equip_img, :equip_img_cache, :name, :explain)
      end
  end
  