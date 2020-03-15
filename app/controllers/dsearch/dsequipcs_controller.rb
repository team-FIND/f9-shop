class Csearch::CsequipcsController < ApplicationController
    before_action :set_cequipc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $csshop = Cshop.where(:id => params[:csshop_id]).first
      $cequipcs = $cshop.cequipcs.all
    end
  
    def show
      redirect_to csearch_csequipc_csequips_path(csequipc_id:$csequipc)
    end
  
    private
  
      def set_cequipc
        $csshop = Cshop.where(:id => params[:csshop_id]).first
        $csequipc = $cshop.cequipcs.where(:id => params[:id]).first
      end
      
      def cequipc_params
        params.require(:cequipc).permit(:cshop_id, :shopname, :user_id, :name)
      end
      
  end
  