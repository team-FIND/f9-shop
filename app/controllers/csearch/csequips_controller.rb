class Csearch::CsequipsController < ApplicationController
    before_action :set_cequip, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $cequipc = Cequipc.where(:id => params[:csequipc_id]).first
      $cequips = $cequipc.cequips.all
      render :layout => "menu_category"
    end
  
    def show
      $cequipc = Cequipc.where(:id => params[:csequipc_id]).first
      $cequips = $cequipc.cequips.all
      render :layout => "shop_equip"
    end
  
    private
      def set_cequip
        $cequipc = Cequipc.where(:id => params[:csequipc_id]).first
        $cequip = $cequipc.cequips.where(:id => params[:id]).first
      end
  
      def cequip_params
        params.require(:cequip).permit(:cequipc_id, :user_id, :equip_img, :equip_img_cache, :name, :explain)
      end
  end
  