class Dsearch::DsstaffcsController < ApplicationController
    before_action :set_dstaffc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $dsshop = Dshop.where(:id => params[:dsshop_id]).first
      $dstaffcs = $dshop.dstaffcs.all
    end
  
    def show
      redirect_to dsearch_dsstaffc_dsstaffs_path(dsstaffc_id:$dsstaffc)
    end
  
    private
  
      def set_dstaffc
        $dsshop = Dshop.where(:id => params[:dsshop_id]).first
        $dsstaffc = $dshop.dstaffcs.where(:id => params[:id]).first
      end
      
      def dstaffc_params
        params.require(:dstaffc).permit(:dshop_id, :shopname, :user_id, :name)
      end
      
  end
  