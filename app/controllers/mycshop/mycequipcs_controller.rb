class Mycshop::MycequipcsController < ApplicationController
    before_action :set_cequipc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $cshop = Cshop.where(:id => params[:mycshop_id]).first
      $cequipcs = $cshop.cequipcs.all
    end
  
    def show
      redirect_to mycshop_mycequipc_mycequips_path(mycequipc_id:$cequipc)
    end
  
    def new
      $cshop = Cshop.where(:id => params[:mycshop_id]).first
      $cequipc = $cshop.cequipcs.build
      render :layout => "shop/ashop/menu_edit"
    end
  
    def edit
      render :layout => "shop/ashop/menu_edit"
    end
  
    def create
      $cshop = Cshop.where(:id => params[:mycshop_id]).first
      $cequipc = $cshop.cequipcs.build(cequipc_params)
      $cequipc.user_id = current_user.id
  
      respond_to do |format|
        if $cequipc.save
          format.html { redirect_to mycshop_mycshop_path(id:$cshop), notice: 'Acategory was successfully created.' }
          format.json { render :show, status: :created, location: $cequipc }
        else
          format.html { render :new }
          format.json { render json: $cequipc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $cequipc.update(cequipc_params)
          format.html { redirect_to mycshop_mycshop_path(id:$cshop), notice: 'Acategory was successfully updated.' }
          format.json { render :show, status: :ok, location: $cequipc }
        else
          format.html { render :edit }
          format.json { render json: $cequipc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    def destroy
      $cequipc.destroy
      respond_to do |format|
        format.html { redirect_to mycshop_mycshop_path(id:$cshop), notice: 'Top was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_cequipc
        $cshop = Cshop.where(:id => params[:mycshop_id]).first
        $cequipc = $cshop.cequipcs.where(:id => params[:id]).first
      end
      
      def cequipc_params
        params.require(:cequipc).permit(:cshop_id, :shopname, :user_id, :name)
      end
      
  end
  