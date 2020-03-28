class Gsearch::BGsstaffcsController < ApplicationController
    before_action :set_gstaffc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $gsshop = Gshop.where(:id => params[:gsshop_id]).first
      $gstaffcs = $gshop.gstaffcs.all
    end
  
    def show
      redirect_to gsearch_gsstaffc_gsstaffs_path(gsstaffc_id:$gsstaffc)
    end
  
    private
  ßßß
      def set_gstaffc
        $gsshop = Gshop.where(:id => params[:gsshop_id]).first
        $gsstaffc = $gshop.gstaffcs.where(:id => params[:id]).first
      end
      
      def gstaffc_params
        params.require(:gstaffc).permit(:gshop_id, :shopname, :user_id, :name)
      end
      
  end
  