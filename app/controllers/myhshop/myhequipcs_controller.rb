class Myhshop::MyhequipcsController < ApplicationController
    before_action :set_hequipc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $hshop = Hshop.where(:id => params[:myhshop_id]).first
      $hequipcs = $hshop.hequipcs.all
    end
  
    def show
      redirect_to myhshop_myhequipc_myhequips_path(myhequipc_id:$hequipc)
    end
  
    def new
      $hshop = Hshop.where(:id => params[:myhshop_id]).first
      $hequipc = $hshop.hequipcs.build
      render :layout => "shop/ashop/menu_edit"
    end
    
    def edit
      render :layout => "shop/ashop/menu_edit"
    end
  
    def create
      $hshop = Hshop.where(:id => params[:myhshop_id]).first
      $hequipc = $hshop.hequipcs.build(hequipc_params)
      $hequipc.user_id = current_user.id
  
      respond_to do |format|
        if $hequipc.save
          format.html { redirect_to myhshop_myhshop_path(id:$hshop), notice: 'Acategory was successfully created.' }
          format.json { render :show, status: :created, location: $hequipc }
        else
          format.html { render :new }
          format.json { render json: $hequipc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $hequipc.update(hequipc_params)
          format.html { redirect_to myhshop_myhshop_path(id:$hshop), notice: 'Acategory was successfully updated.' }
          format.json { render :show, status: :ok, location: $hequipc }
        else
          format.html { render :edit }
          format.json { render json: $hequipc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    def destroy
      $hequipc.destroy
      respond_to do |format|
        format.html { redirect_to myhshop_myhshop_path(id:$hshop), notice: 'Top was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_hequipc
        $hshop = Hshop.where(:id => params[:myhshop_id]).first
        $hequipc = $hshop.hequipcs.where(:id => params[:id]).first
      end
      
      def hequipc_params
        params.require(:hequipc).permit(:hshop_id, :shopname, :user_id, :name)
      end
      
  end
  