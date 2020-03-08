class Bsshop::BsequipcsController < ApplicationController
    before_action :set_bsequipc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $bsshop = Bsshop.where(:id => params[:bsshop_id]).first
      $bsequipcs = $bsshop.bsequipcs.all
    end
  
    def show
      redirect_to bsshop_bsequipc_bsequips_path(bsequipc_id:$bsequipc)
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_bsequipc
        $bsshop = Bsshop.where(:id => params[:bsshop_id]).first
        $bsequipc = $bsshop.bsequipcs.where(:id => params[:id]).first
      end
      
      def bsequipc_params
        params.require(:bsequipc).permit(:bsshop_id, :shopname, :user_id, :name)
      end
      
  end
  