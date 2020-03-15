class Mydshop::MydstaffcsController < ApplicationController
    before_action :set_dstaffc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $dshop = Dshop.where(:id => params[:mydshop_id]).first
      $dstaffcs = $dshop.dstaffcs.all
    end
  
    def show
      redirect_to mydshop_mydstaffc_mydstaffs_path(mydstaffc_id:$dstaffc)
    end
  
    def new
      $dshop = Dshop.where(:id => params[:mydshop_id]).first
      $dstaffc = $dshop.dstaffcs.build
      render :layout => "shop/ashop/menu_edit"
    end
  
    def edit
      render :layout => "shop/ashop/menu_edit"
    end
  
    def create
      $dshop = Dshop.where(:id => params[:mydshop_id]).first
      $dstaffc = $dshop.dstaffcs.build(dstaffc_params)
      $dstaffc.user_id = current_user.id
  
      respond_to do |format|
        if $dstaffc.save
          format.html { redirect_to mydshop_mydshop_path(id:$dshop), notice: 'Acategory was successfully created.' }
          format.json { render :show, status: :created, location: $dstaffc }
        else
          format.html { render :new }
          format.json { render json: $dstaffc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $dstaffc.update(dstaffc_params)
          format.html { redirect_to mydshop_mydshop_path(id:$dshop), notice: 'Acategory was successfully updated.' }
          format.json { render :show, status: :ok, location: $dstaffc }
        else
          format.html { render :edit }
          format.json { render json: $dstaffc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    def destroy
      $dstaffc.destroy
      respond_to do |format|
        format.html { redirect_to mydshop_mydshop_path(id:$dshop), notice: 'Top was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_dstaffc
        $dshop = Dshop.where(:id => params[:mydshop_id]).first
        $dstaffc = $dshop.dstaffcs.where(:id => params[:id]).first
      end
      
      def dstaffc_params
        params.require(:dstaffc).permit(:dshop_id, :shopname, :user_id, :name)
      end
  end
  