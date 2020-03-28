class Fsearch::FsstaffcsController < ApplicationController
    before_action :set_fstaffc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $fsshop = Fshop.where(:id => params[:fsshop_id]).first
      $fstaffcs = $fshop.fstaffcs.all
    end
  
    def show
      redirect_to fsearch_fsstaffc_fsstaffs_path(fsstaffc_id:$fsstaffc)
    end
  
    private
  
      def set_fstaffc
        $fsshop = Fshop.where(:id => params[:fsshop_id]).first
        $bsstaffc = $fshop.fstaffcs.where(:id => params[:id]).first
      end
      
      def fstaffc_params
        params.require(:fstaffc).permit(:fshop_id, :shopname, :user_id, :name)
      end
      
  end
  