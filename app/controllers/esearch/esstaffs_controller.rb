class Esearch::EsstaffsController < ApplicationController
    before_action :set_estaff, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?

    def index
      $estaffc = Estaffc.where(:id => params[:esstaffc_id]).first
      $estaffs = $estaffc.estaffs.all
      render :layout => "menu_category"
    end
  
    def show
      $estaffc = Estaffc.where(:id => params[:esstaffc_id]).first
      $estaffs = $estaffc.estaffs.all
      render :layout => "shop_staff"
    end
  
    private
      def set_estaff
        $estaffc = Estaffc.where(:id => params[:esstaffc_id]).first
        $estaff = $estaffc.estaffs.where(:id => params[:id]).first
      end
  
      def estaff_params
        params.require(:estaff).permit(:estaffc_id, :user_id, :staff_img, :staff_img_cache, :name, :explain)
      end
  end
  