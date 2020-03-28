class Hsearch::HsstaffcsController < ApplicationController
    before_action :set_hstaffc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $hsshop = Hshop.where(:id => params[:hsshop_id]).first
      $hstaffcs = $hshop.hstaffcs.all
    end
  
    def show
      redirect_to hsearch_hsstaffc_hsstaffs_path(hsstaffc_id:$hsstaffc)
    endß
  
    private
  
      def set_hstaffc
        $hsshop = Hshop.where(:id => params[:hsshop_id]).first
        $hsstaffc = $hshop.hstaffcs.where(:id => params[:id]).first
      end
      
      def hstaffc_params
        params.require(:hstaffc).permit(:hshop_id, :shopname, :user_id, :name)
      end
      
  end
  