class Bsearch::BsequipsController < ApplicationController
    before_action :set_bequip, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $bequipc = Bequipc.where(:id => params[:bsequipc_id]).first
      $bequips = $bequipc.bequips.all
      render :layout => "menu_category"
    end
  
    def show
      $bequipc = Bequipc.where(:id => params[:bsequipc_id]).first
      $bequips = $bequipc.bequips.all
      render :layout => "shop_equip"
    end
  
    def edit
      $bequip.equip_img.cache! unless $bsequip.equip_img.blank?
      render :layout => "shop/ashop/edit"
    end
  
    def equip_img
      $bequip.equip_img.cache! unless $bsequip.equip_img.blank? 
      render :layout => "shop/ashop/edit"
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
      def set_bequip
        $bequipc = Bequipc.where(:id => params[:bsequipc_id]).first
        $bequip = $bequipc.bequips.where(:id => params[:id]).first
      end
  
      def bequip_params
        params.require(:bequip).permit(:bequipc_id, :user_id, :equip_img, :equip_img_cache, :name, :explain)
      end
  end
  