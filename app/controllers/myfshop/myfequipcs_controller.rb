class Myfshop::MyfequipcsController < ApplicationController
    before_action :set_fequipc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $fshop = Fshop.where(:id => params[:myfshop_id]).first
      $fequipcs = $fshop.fequipcs.all
    end
  
    def show
      redirect_to myfshop_myfequipc_myfequips_path(myfequipc_id:$fequipc)
    end
  
    def new
      $fshop = Fshop.where(:id => params[:myfshop_id]).first
      $fequipc = $fshop.fequipcs.build
      render :layout => "shop/ashop/menu_edit"
    end
  
    def edit
      render :layout => "shop/ashop/menu_edit"
    end
  
    def create
      $fshop = Fshop.where(:id => params[:myfshop_id]).first
      $fequipc = $fshop.fequipcs.build(fequipc_params)
      $fequipc.user_id = current_user.id
  
      respond_to do |format|
        if $fequipc.save
          format.html { redirect_to myfshop_myfshop_path(id:$fshop), notice: 'Acategory was successfully created.' }
          format.json { render :show, status: :created, location: $fequipc }
        else
          format.html { render :new }
          format.json { render json: $fequipc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $fequipc.update(fequipc_params)
          format.html { redirect_to myfshop_myfshop_path(id:$fshop), notice: 'Acategory was successfully updated.' }
          format.json { render :show, status: :ok, location: $fequipc }
        else
          format.html { render :edit }
          format.json { render json: $fequipc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    def destroy
      $fequipc.destroy
      respond_to do |format|
        format.html { redirect_to myfshop_myfshop_path(id:$fshop), notice: 'Top was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_fequipc
        $fshop = Fshop.where(:id => params[:myfshop_id]).first
        $fequipc = $fshop.fequipcs.where(:id => params[:id]).first
      end
      
      def fequipc_params
        params.require(:fequipc).permit(:fshop_id, :shopname, :user_id, :name)
      end
      
  end
  