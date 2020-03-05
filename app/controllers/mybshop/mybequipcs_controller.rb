class Mybshop::MybequipcsController < ApplicationController
    before_action :set_bequipc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $bshop = Bshop.where(:id => params[:mybshop_id]).first
      $bequipcs = $bshop.bequipcs.all
    end
  
    def show
      $bshop = Bshop.where(:id => params[:mybshop_id]).first
      $bequipcs = $bshop.bequipcs.all
      render :layout => "menu_category"
    end
  
    def new
      $bshop = Bshop.where(:id => params[:mybshop_id]).first
      $bequipc = $bshop.bequipcs.build
      render :layout => "shop/ashop/menu_edit"
    end
  
    def edit
      render :layout => "shop/ashop/menu_edit"
    end
  
    def subedit
      render :layout => "shop/ashop/menu_edit"
    end
  
    def create
      $bshop = Bshop.where(:id => params[:mybshop_id]).first
      $bequipc = $bshop.bequipcs.build(bequipc_params)
      $bequipc.user_id = current_user.id
  
      respond_to do |format|
        if $bequipc.save
          format.html { redirect_to mybshop_mybshop_path(id:$bshop), notice: 'Acategory was successfully created.' }
          format.json { render :show, status: :created, location: $bequipc }
        else
          format.html { render :new }
          format.json { render json: $bequipc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $bequipc.update(bequipc_params)
          format.html { redirect_to mybshop_mybshop_path(id:$bshop), notice: 'Acategory was successfully updated.' }
          format.json { render :show, status: :ok, location: $bequipc }
        else
          format.html { render :edit }
          format.json { render json: $bequipc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    def destroy
      $bequipc.destroy
      respond_to do |format|
        format.html { redirect_to mybshop_mybshop_path(id:$bshop), notice: 'Top was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_bequipc
        $bshop = Bshop.where(:id => params[:mybshop_id]).first
        $bequipc = $bshop.bequipcs.where(:id => params[:id]).first
      end
      
      def bequipc_params
        params.require(:bequipc).permit(:bshop_id, :shopname, :user_id, :name, :content)
      end
  end
  