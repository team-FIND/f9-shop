class Bsearch::BsstaffsController < ApplicationController
    before_action :set_bstaff, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $bstaffc = Bstaffc.where(:id => params[:bsstaffc_id]).first
      $bstaffs = $bstaffc.bstaffs.all
      render :layout => "menu_category"
    end
  
    def show
      $bstaffc = Bstaffc.where(:id => params[:bsstaffc_id]).first
      $bstaffs = $bstaffc.bstaffs.all
      render :layout => "shop_staff"
    end
  
    private
      def set_bstaff
        $bstaffc = Bstaffc.where(:id => params[:bsstaffc_id]).first
        $bstaff = $bstaffc.bstaffs.where(:id => params[:id]).first
      end
  
      def bstaff_params
        params.require(:bstaff).permit(:bstaffc_id, :user_id, :staff_img, :staff_img_cache, :name, :explain)
      end
  end
  