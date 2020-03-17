class Mydshop::MydequipcsController < ApplicationController
    before_action :set_dequipc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $dshop = Dshop.where(:id => params[:mydshop_id]).first
      $dequipcs = $dshop.dequipcs.all
    end
  
    def show
      redirect_to mydshop_mydequipc_mydequips_path(mydequipc_id:$dequipc)
    end
  
    def new
      $dshop = Dshop.where(:id => params[:mydshop_id]).first
      $dequipc = $dshop.dequipcs.build
      render :layout => "shop/ashop/menu_edit"
    end
    
    def edit
      render :layout => "shop/ashop/menu_edit"
    end
  
    def create
      $dshop = Dshop.where(:id => params[:mydshop_id]).first
      $dequipc = $dshop.dequipcs.build(dequipc_params)
      $dequipc.user_id = current_user.id
  
      respond_to do |format|
        if $dequipc.save
          format.html { redirect_to mydshop_mydshop_path(id:$dshop), notice: 'Acategory was successfully created.' }
          format.json { render :show, status: :created, location: $dequipc }
        else
          format.html { render :new }
          format.json { render json: $dequipc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $dequipc.update(dequipc_params)
          format.html { redirect_to mydshop_mydshop_path(id:$dshop), notice: 'Acategory was successfully updated.' }
          format.json { render :show, status: :ok, location: $dequipc }
        else
          format.html { render :edit }
          format.json { render json: $dequipc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    def destroy
      $dequipc.destroy
      respond_to do |format|
        format.html { redirect_to mydshop_mydshop_path(id:$dshop), notice: 'Top was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_dequipc
        $dshop = Dshop.where(:id => params[:mydshop_id]).first
        $dequipc = $dshop.dequipcs.where(:id => params[:id]).first
      end
      
      def dequipc_params
        params.require(:dequipc).permit(:dshop_id, :shopname, :user_id, :name)
      end
      
  end
  