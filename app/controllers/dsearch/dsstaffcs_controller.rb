class Csearch::CsstaffcsController < ApplicationController
    before_action :set_cstaffc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $csshop = Cshop.where(:id => params[:csshop_id]).first
      $cstaffcs = $cshop.cstaffcs.all
    end
  
    def show
      redirect_to csearch_csstaffc_csstaffs_path(csstaffc_id:$csstaffc)
    end
  
    private
  
      def set_cstaffc
        $csshop = Cshop.where(:id => params[:csshop_id]).first
        $csstaffc = $cshop.cstaffcs.where(:id => params[:id]).first
      end
      
      def cstaffc_params
        params.require(:cstaffc).permit(:cshop_id, :shopname, :user_id, :name)
      end
      
  end
  