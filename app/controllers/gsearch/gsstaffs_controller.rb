class Gsearch::GsstaffsController < ApplicationController
    before_action :set_gstaff, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $gstaffc = Gstaffc.where(:id => params[:gsstaffc_id]).first
      $gstaffs = $gstaffc.gstaffs.all
      render :layout => "menu_category"
    end
  
    def show
      $gstaffc = Gstaffc.where(:id => params[:gsstaffc_id]).first
      $gstaffs = $gstaffc.gstaffs.all
      render :layout => "shop_staff"
    end
  
    private
      def set_gstaff
        $gstaffc = Gstaffc.where(:id => params[:gsstaffc_id]).first
        $gstaff = $gstaffc.gstaffs.where(:id => params[:id]).first
      end
  
      def gstaff_params
        params.require(:gstaff).permit(:gstaffc_id, :user_id, :staff_img, :staff_img_cache, :name, :explain)
      end
  end
  