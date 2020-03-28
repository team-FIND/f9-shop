class Fsearch::FsequipcsController < ApplicationController
    before_action :set_fequipc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $fsshop = Fshop.where(:id => params[:fsshop_id]).first
      $fequipcs = $fshop.fequipcs.all
    end
  
    def show
      redirect_to fsearch_fsequipc_fsequips_path(fsequipc_id:$fsequipc)
    end
  
    private
  
      def set_fequipc
        $fsshop = Fshop.where(:id => params[:fsshop_id]).first
        $bsequipc = $fshop.fequipcs.where(:id => params[:id]).first
      end
      
      def fequipc_params
        params.require(:fequipc).permit(:fshop_id, :shopname, :user_id, :name)
      end
      
  end
  