class Bsearch::BsstaffcsController < ApplicationController
    before_action :set_bstaffc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $bsshop = Bshop.where(:id => params[:bsshop_id]).first
      $bstaffcs = $bshop.bstaffcs.all
    end
  
    def show
      redirect_to bsearch_bsstaffc_bsstaffs_path(bsstaffc_id:$bsstaffc)
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_bstaffc
        $bsshop = Bshop.where(:id => params[:bsshop_id]).first
        $bsstaffc = $bshop.bstaffcs.where(:id => params[:id]).first
      end
      
      def bstaffc_params
        params.require(:bstaffc).permit(:bshop_id, :shopname, :user_id, :name)
      end
      
  end
  