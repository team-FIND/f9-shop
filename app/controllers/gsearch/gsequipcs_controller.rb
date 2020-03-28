class Gsearch::GsequipcsController < ApplicationController
    before_action :set_gequipc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $gsshop = Gshop.where(:id => params[:gsshop_id]).first
      $gequipcs = $gshop.gequipcs.all
    end
  
    def show
      redirect_to gsearch_gsequipc_gsequips_path(gsequipc_id:$gsequipc)
    end
  
    private
  
      def set_gequipc
        $gsshop = Gshop.where(:id => params[:gsshop_id]).first
        $bsequipc = $gshop.gequipcs.where(:id => params[:id]).first
      end
      
      def gequipc_params
        params.require(:gequipc).permit(:gshop_id, :shopname, :user_id, :name)
      end
      
  end
  