class Esearch::EsequipcsController < ApplicationController
    before_action :set_eequipc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $esshop = Eshop.where(:id => params[:esshop_id]).first
      $eequipcs = $eshop.eequipcs.all
    end
  
    def show
      redirect_to esearch_esequipc_esequips_path(esequipc_id:$esequipc)
    end
  
    private
  
      def set_eequipc
        $esshop = Eshop.where(:id => params[:esshop_id]).first
        $esequipc = $eshop.eequipcs.where(:id => params[:id]).first
      end
      
      def eequipc_params
        params.require(:eequipc).permit(:dshop_id, :shopname, :user_id, :name)
      end
      
  end
  