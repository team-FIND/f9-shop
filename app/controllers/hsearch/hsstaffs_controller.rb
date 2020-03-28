class Hsearch::HsstaffsController < ApplicationController
    before_action :set_hstaff, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?

    def index
      $hstaffc = Hstaffc.where(:id => params[:hsstaffc_id]).first
      $hstaffs = $hstaffc.hstaffs.all
      render :layout => "menu_category"
    end
  
    def show
      $hstaffc = Hstaffc.where(:id => params[:hsstaffc_id]).first
      $hstaffs = $hstaffc.hstaffs.all
      render :layout => "shop_staff"
    end
  
    private
      def set_hstaff
        $hstaffc = Hstaffc.where(:id => params[:hsstaffc_id]).first
        $hstaff = $hstaffc.hstaffs.where(:id => params[:id]).first
      end
  
      def hstaff_params
        params.require(:hstaff).permit(:hstaffc_id, :user_id, :staff_img, :staff_img_cache, :name, :explain)
      end
  end
  