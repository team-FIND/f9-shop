class Dsearch::DsstaffsController < ApplicationController
    before_action :set_dstaff, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?

    def index
      $dstaffc = dstaffc.where(:id => params[:dsstaffc_id]).first
      $dstaffs = $dstaffc.dstaffs.all
      render :layout => "menu_category"
    end
  
    def show
      $dstaffc = dstaffc.where(:id => params[:dsstaffc_id]).first
      $dstaffs = $dstaffc.dstaffs.all
      render :layout => "shop_staff"
    end
  
    private
      def set_dstaff
        $dstaffc = dstaffc.where(:id => params[:dsstaffc_id]).first
        $dstaff = $dstaffc.dstaffs.where(:id => params[:id]).first
      end
  
      def dstaff_params
        params.require(:dstaff).permit(:dstaffc_id, :user_id, :staff_img, :staff_img_cache, :name, :explain)
      end
  end
  