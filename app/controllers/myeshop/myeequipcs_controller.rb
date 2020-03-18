class Myeshop::MyeequipcsController < ApplicationController
    before_action :set_eequipc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $eshop = Eshop.where(:id => params[:myeshop_id]).first
      $eequipcs = $eshop.eequipcs.all
    end
  
    def show
      redirect_to myeshop_myeequipc_myeequips_path(myeequipc_id:$eequipc)
    end
  
    def new
      $eshop = Eshop.where(:id => params[:myeshop_id]).first
      $eequipc = $eshop.eequipcs.build
      render :layout => "shop/ashop/menu_edit"
    end
    
    def edit
      render :layout => "shop/ashop/menu_edit"
    end
  
    def create
      $eshop = Eshop.where(:id => params[:myeshop_id]).first
      $eequipc = $eshop.eequipcs.build(eequipc_params)
      $eequipc.user_id = current_user.id
  
      respond_to do |format|
        if $eequipc.save
          format.html { redirect_to myeshop_myeshop_path(id:$eshop), notice: 'Acategory was successfully created.' }
          format.json { render :show, status: :created, location: $eequipc }
        else
          format.html { render :new }
          format.json { render json: $eequipc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $eequipc.update(eequipc_params)
          format.html { redirect_to myeshop_myeshop_path(id:$eshop), notice: 'Acategory was successfully updated.' }
          format.json { render :show, status: :ok, location: $eequipc }
        else
          format.html { render :edit }
          format.json { render json: $eequipc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      $eequipc.destroy
      respond_to do |format|
        format.html { redirect_to myeshop_myeshop_path(id:$eshop), notice: 'Top was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_eequipc
        $eshop = Eshop.where(:id => params[:myeshop_id]).first
        $eequipc = $eshop.eequipcs.where(:id => params[:id]).first
      end
      
      def eequipc_params
        params.require(:eequipc).permit(:eshop_id, :shopname, :user_id, :name)
      end
      
  end
  