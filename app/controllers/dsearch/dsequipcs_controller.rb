class Dsearch::DsequipcsController < ApplicationController
    before_action :set_dequipc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $dsshop = Dshop.where(:id => params[:dsshop_id]).first
      $dequipcs = $dshop.dequipcs.all
    end
  
    def show
      redirect_to dsearch_dsequipc_dsequips_path(dsequipc_id:$dsequipc)
    end
  
    private
  
      def set_dequipc
        $dsshop = Dshop.where(:id => params[:dsshop_id]).first
        $dsequipc = $dshop.dequipcs.where(:id => params[:id]).first
      end
      
      def dequipc_params
        params.require(:dequipc).permit(:dshop_id, :shopname, :user_id, :name)
      end
      
  end
  