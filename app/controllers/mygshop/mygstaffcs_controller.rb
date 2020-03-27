class Mygshop::MygstaffcsController < ApplicationController
    before_action :set_gstaffc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $gshop = Gshop.where(:id => params[:mygshop_id]).first
      $gstaffcs = $gshop.gstaffcs.all
    end
  
    def show
      redirect_to mygshop_mygstaffc_mygstaffs_path(mygstaffc_id:$gstaffc)
    end
  
    def new
      $gshop = Gshop.where(:id => params[:mygshop_id]).first
      $gstaffc = $gshop.gstaffcs.build
      render :layout => "shop/ashop/menu_edit"
    end
  
    def edit
      render :layout => "shop/ashop/menu_edit"
    end
  
    def create
      $gshop = Gshop.where(:id => params[:mygshop_id]).first
      $gstaffc = $gshop.gstaffcs.build(gstaffc_params)
      $gstaffc.user_id = current_user.id
  
      respond_to do |format|
        if $gstaffc.save
          format.html { redirect_to mygshop_mygshop_path(id:$gshop), notice: 'Acategory was successfully created.' }
          format.json { render :show, status: :created, location: $gstaffc }
        else
          format.html { render :new }
          format.json { render json: $gstaffc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $gstaffc.update(gstaffc_params)
          format.html { redirect_to mygshop_mygshop_path(id:$gshop), notice: 'Acategory was successfully updated.' }
          format.json { render :show, status: :ok, location: $gstaffc }
        else
          format.html { render :edit }
          format.json { render json: $gstaffc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    def destroy
      $gstaffc.destroy
      respond_to do |format|
        format.html { redirect_to mygshop_mygshop_path(id:$gshop), notice: 'Top was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_gstaffc
        $gshop = Gshop.where(:id => params[:mygshop_id]).first
        $gstaffc = $gshop.gstaffcs.where(:id => params[:id]).first
      end
      
      def gstaffc_params
        params.require(:gstaffc).permit(:gshop_id, :shopname, :user_id, :name)
      end
  end
  