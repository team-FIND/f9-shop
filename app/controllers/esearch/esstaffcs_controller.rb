class Esearch::EsstaffcsController < ApplicationController
    before_action :set_estaffc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $esshop = Eshop.where(:id => params[:esshop_id]).first
      $estaffcs = $eshop.estaffcs.all
    end
  
    def show
      redirect_to esearch_esstaffc_esstaffs_path(esstaffc_id:$esstaffc)
    end
  
    private
  
      def set_estaffc
        $esshop = Eshop.where(:id => params[:esshop_id]).first
        $esstaffc = $eshop.estaffcs.where(:id => params[:id]).first
      end
      
      def estaffc_params
        params.require(:estaffc).permit(:eshop_id, :shopname, :user_id, :name)
      end
      
  end
  