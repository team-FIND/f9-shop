class Mycshop::MycstaffcsController < ApplicationController
    before_action :set_cstaffc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $cshop = Cshop.where(:id => params[:mycshop_id]).first
      $cstaffcs = $cshop.cstaffcs.all
    end
  
    def show
      redirect_to mycshop_mycstaffc_mycstaffs_path(mycstaffc_id:$cstaffc)
    end
  
    def new
      $cshop = Cshop.where(:id => params[:mycshop_id]).first
      $cstaffc = $cshop.cstaffcs.build
      render :layout => "shop/ashop/menu_edit"
    end
  
    def edit
      render :layout => "shop/ashop/menu_edit"
    end
  
    def create
      $cshop = Cshop.where(:id => params[:mycshop_id]).first
      $cstaffc = $cshop.cstaffcs.build(cstaffc_params)
      $cstaffc.user_id = current_user.id
  
      respond_to do |format|
        if $cstaffc.save
          format.html { redirect_to mycshop_mycshop_path(id:$cshop), notice: 'Acategory was successfully created.' }
          format.json { render :show, status: :created, location: $cstaffc }
        else
          format.html { render :new }
          format.json { render json: $cstaffc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $cstaffc.update(cstaffc_params)
          format.html { redirect_to mycshop_mycshop_path(id:$cshop), notice: 'Acategory was successfully updated.' }
          format.json { render :show, status: :ok, location: $cstaffc }
        else
          format.html { render :edit }
          format.json { render json: $cstaffc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    def destroy
      $cstaffc.destroy
      respond_to do |format|
        format.html { redirect_to mycshop_mycshop_path(id:$cshop), notice: 'Top was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_cstaffc
        $cshop = Cshop.where(:id => params[:mycshop_id]).first
        $cstaffc = $cshop.cstaffcs.where(:id => params[:id]).first
      end
      
      def cstaffc_params
        params.require(:cstaffc).permit(:cshop_id, :shopname, :user_id, :name)
      end
  end
  