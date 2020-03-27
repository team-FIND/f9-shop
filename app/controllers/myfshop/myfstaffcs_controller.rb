class Myfshop::MyfstaffcsController < ApplicationController
    before_action :set_fstaffc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $fshop = Fshop.where(:id => params[:myfshop_id]).first
      $fstaffcs = $fshop.fstaffcs.all
    end
  
    def show
      redirect_to myfshop_myfstaffc_myfstaffs_path(myfstaffc_id:$fstaffc)
    end
  
    def new
      $fshop = Fshop.where(:id => params[:myfshop_id]).first
      $fstaffc = $fshop.fstaffcs.build
      render :layout => "shop/ashop/menu_edit"
    end
  
    def edit
      render :layout => "shop/ashop/menu_edit"
    end
  
    def create
      $fshop = Fshop.where(:id => params[:myfshop_id]).first
      $fstaffc = $fshop.fstaffcs.build(fstaffc_params)
      $fstaffc.user_id = current_user.id
  
      respond_to do |format|
        if $fstaffc.save
          format.html { redirect_to myfshop_myfshop_path(id:$fshop), notice: 'Acategory was successfully created.' }
          format.json { render :show, status: :created, location: $fstaffc }
        else
          format.html { render :new }
          format.json { render json: $fstaffc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $fstaffc.update(fstaffc_params)
          format.html { redirect_to myfshop_myfshop_path(id:$fshop), notice: 'Acategory was successfully updated.' }
          format.json { render :show, status: :ok, location: $fstaffc }
        else
          format.html { render :edit }
          format.json { render json: $fstaffc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    def destroy
      $fstaffc.destroy
      respond_to do |format|
        format.html { redirect_to myfshop_myfshop_path(id:$fshop), notice: 'Top was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_fstaffc
        $fshop = Fshop.where(:id => params[:myfshop_id]).first
        $fstaffc = $fshop.fstaffcs.where(:id => params[:id]).first
      end
      
      def fstaffc_params
        params.require(:fstaffc).permit(:fshop_id, :shopname, :user_id, :name)
      end
  end
  