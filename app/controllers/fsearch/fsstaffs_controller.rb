class Fsearch::FsstaffsController < ApplicationController
    before_action :set_fstaff, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $fstaffc = Fstaffc.where(:id => params[:fsstaffc_id]).first
      $fstaffs = $fstaffc.fstaffs.all
      render :layout => "menu_category"
    end
  
    def show
      $fstaffc = Fstaffc.where(:id => params[:fsstaffc_id]).first
      $fstaffs = $fstaffc.fstaffs.all
      render :layout => "shop_staff"
    end
  
    private
      def set_fstaff
        $fstaffc = Fstaffc.where(:id => params[:fsstaffc_id]).first
        $fstaff = $fstaffc.fstaffs.where(:id => params[:id]).first
      end
  
      def fstaff_params
        params.require(:fstaff).permit(:fstaffc_id, :user_id, :staff_img, :staff_img_cache, :name, :explain)
      end
  end
  