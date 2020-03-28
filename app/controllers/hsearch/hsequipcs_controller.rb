class Hsearch::HsequipcsController < ApplicationController
    before_action :set_hequipc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $hsshop = Hshop.where(:id => params[:hsshop_id]).first
      $hequipcs = $hshop.hequipcs.all
    end
  
    def show
      redirect_to hsearch_hsequipc_hsequips_path(hsequipc_id:$hsequipc)
    end
  
    private
  
      def set_hequipc
        $hsshop = Hshop.where(:id => params[:hsshop_id]).first
        $hsequipc = $hshop.hequipcs.where(:id => params[:id]).first
      end
      
      def hequipc_params
        params.require(:hequipc).permit(:hshop_id, :shopname, :user_id, :name)
      end
      
  end
  