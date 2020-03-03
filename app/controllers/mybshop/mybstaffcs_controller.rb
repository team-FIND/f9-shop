class Mybshop::MybmenucsController < ApplicationController
    before_action :set_bmenuc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $bshop = Bshop.where(:id => params[:mybshop_id]).first
      $bmenucs = $bshop.bmenucs.all
    end
  
    def show
      $bshop = Bshop.where(:id => params[:mybshop_id]).first
      $bmenucs = $bshop.bmenucs.all
      render :layout => "menu_category"
    end
  
    def new
      $bshop = Bshop.where(:id => params[:mybshop_id]).first
      $bmenuc = $bshop.bmenucs.build
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
      $bmenuc = $bshop.bmenucs.build(bmenuc_params)
      $bmenuc.user_id = current_user.id
  
      respond_to do |format|
        if $bmenuc.save
          format.html { redirect_to mybshop_mybshop_path(id:$bshop), notice: 'Acategory was successfully created.' }
          format.json { render :show, status: :created, location: $bmenuc }
        else
          format.html { render :new }
          format.json { render json: $bmenuc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $bmenuc.update(bmenuc_params)
          format.html { redirect_to mybshop_mybshop_path(id:$bshop), notice: 'Acategory was successfully updated.' }
          format.json { render :show, status: :ok, location: $bmenuc }
        else
          format.html { render :edit }
          format.json { render json: $bmenuc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    def destroy
      $bmenuc.destroy
      respond_to do |format|
        format.html { redirect_to mybshop_mybshop_path(id:$bshop), notice: 'Top was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_bmenuc
        $bshop = Bshop.where(:id => params[:mybshop_id]).first
        $bmenuc = $bshop.bmenucs.where(:id => params[:id]).first
      end
      
      def bmenuc_params
        params.require(:bmenuc).permit(:bshop_id, :shopname, :user_id, :name, :content)
      end
  end
  