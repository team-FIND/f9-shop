class Mybshop::MybstaffcsController < ApplicationController
    before_action :set_bstaffc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $bshop = Bshop.where(:id => params[:mybshop_id]).first
      $bstaffcs = $bshop.bstaffcs.all
    end
  
    def show
      $bshop = Bshop.where(:id => params[:mybshop_id]).first
      $bstaffcs = $bshop.bstaffcs.all
      render :layout => "menu_category"
    end
  
    def new
      $bshop = Bshop.where(:id => params[:mybshop_id]).first
      $bstaffc = $bshop.bstaffcs.build
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
      $bstaffc = $bshop.bstaffcs.build(bstaffc_params)
      $bstaffc.user_id = current_user.id
  
      respond_to do |format|
        if $bstaffc.save
          format.html { redirect_to mybshop_mybshop_path(id:$bshop), notice: 'Acategory was successfully created.' }
          format.json { render :show, status: :created, location: $bstaffc }
        else
          format.html { render :new }
          format.json { render json: $bstaffc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $bstaffc.update(bstaffc_params)
          format.html { redirect_to mybshop_mybshop_path(id:$bshop), notice: 'Acategory was successfully updated.' }
          format.json { render :show, status: :ok, location: $bstaffc }
        else
          format.html { render :edit }
          format.json { render json: $bstaffc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    def destroy
      $bstaffc.destroy
      respond_to do |format|
        format.html { redirect_to mybshop_mybshop_path(id:$bshop), notice: 'Top was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_bstaffc
        $bshop = Bshop.where(:id => params[:mybshop_id]).first
        $bstaffc = $bshop.bstaffcs.where(:id => params[:id]).first
      end
      
      def bstaffc_params
        params.require(:bstaffc).permit(:bshop_id, :shopname, :user_id, :name, :content)
      end
  end
  