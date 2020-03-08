class Bsshop::BsequipsController < ApplicationController
    before_action :set_bsequip, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $bsequipc = Bsequipc.where(:id => params[:bsequipc_id]).first
      $bsequips = $bsequipc.bsequips.all
      render :layout => "menu_category"
    end
  
    def show
      $bsequipc = Bsequipc.where(:id => params[:bsequipc_id]).first
      $bsequips = $bsequipc.bsequips.all
      render :layout => "shop_equip"
    end
  
    def edit
      $bsequip.equip_img.cache! unless $bsequip.equip_img.blank?
      render :layout => "shop/ashop/edit"
    end
  
    def equip_img
      $bsequip.equip_img.cache! unless $bsequip.equip_img.blank? 
      render :layout => "shop/ashop/edit"
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
      def set_bsequip
        $bsequipc = Bsequipc.where(:id => params[:bsequipc_id]).first
        $bsequip = $bsequipc.bsequips.where(:id => params[:id]).first
      end
  
      def bsequip_params
        params.require(:bsequip).permit(:bsequipc_id, :user_id, :equip_img, :equip_img_cache, :name, :explain)
      end
  end
  