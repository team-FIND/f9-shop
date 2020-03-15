class Csearch::CsstaffsController < ApplicationController
    before_action :set_cstaff, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?

    def index
      $cstaffc = Cstaffc.where(:id => params[:csstaffc_id]).first
      $cstaffs = $cstaffc.cstaffs.all
      render :layout => "menu_category"
    end
  
    def show
      $cstaffc = Cstaffc.where(:id => params[:csstaffc_id]).first
      $cstaffs = $cstaffc.cstaffs.all
      render :layout => "shop_staff"
    end
  
    private
      def set_cstaff
        $cstaffc = Cstaffc.where(:id => params[:csstaffc_id]).first
        $cstaff = $cstaffc.cstaffs.where(:id => params[:id]).first
      end
  
      def cstaff_params
        params.require(:cstaff).permit(:cstaffc_id, :user_id, :staff_img, :staff_img_cache, :name, :explain)
      end
  end
  