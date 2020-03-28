class Fsearch::FsequipsController < ApplicationController
    before_action :set_fequip, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $fequipc = Fequipc.where(:id => params[:fsequipc_id]).first
      $fequips = $fequipc.fequips.all
      render :layout => "menu_category"
    end
  
    def show
      $fequipc = Fequipc.where(:id => params[:fsequipc_id]).first
      $fequips = $fequipc.fequips.all
      render :layout => "shop_equip"
    end
  
    private
      def set_fequip
        $fequipc = Fequipc.where(:id => params[:fsequipc_id]).first
        $fequip = $fequipc.fequips.where(:id => params[:id]).first
      end
  
      def fequip_params
        params.require(:fequip).permit(:fequipc_id, :user_id, :equip_img, :equip_img_cache, :name, :explain)
      end
  end
  