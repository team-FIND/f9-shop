class Bsearch::BsequipcsController < ApplicationController
    before_action :set_bequipc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $bsshop = Bshop.where(:id => params[:bsshop_id]).first
      $bequipcs = $bshop.bequipcs.all
    end
  
    def show
      redirect_to bsearch_bsequipc_bsequips_path(bsequipc_id:$bsequipc)
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_bequipc
        $bsshop = Bshop.where(:id => params[:bsshop_id]).first
        $bsequipc = $bshop.bequipcs.where(:id => params[:id]).first
      end
      
      def bequipc_params
        params.require(:bequipc).permit(:bshop_id, :shopname, :user_id, :name)
      end
      
  end
  