class Myeshop::MyestaffcsController < ApplicationController
    before_action :set_estaffc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $eshop = Eshop.where(:id => params[:myeshop_id]).first
      $estaffcs = $eshop.estaffcs.all
    end
  
    def show
      redirect_to myeshop_myestaffc_myestaffs_path(myestaffc_id:$estaffc)
    end
  
    def new
      $eshop = Eshop.where(:id => params[:myeshop_id]).first
      $estaffc = $eshop.estaffcs.build
      render :layout => "shop/ashop/menu_edit"
    end
  
    def edit
      render :layout => "shop/ashop/menu_edit"
    end
  
    def create
      $eshop = Eshop.where(:id => params[:myeshop_id]).first
      $estaffc = $eshop.estaffcs.build(estaffc_params)
      $estaffc.user_id = current_user.id
  
      respond_to do |format|
        if $estaffc.save
          format.html { redirect_to myeshop_myeshop_path(id:$eshop), notice: 'Acategory was successfully created.' }
          format.json { render :show, status: :created, location: $estaffc }
        else
          format.html { render :new }
          format.json { render json: $estaffc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $estaffc.update(estaffc_params)
          format.html { redirect_to myeshop_myeshop_path(id:$eshop), notice: 'Acategory was successfully updated.' }
          format.json { render :show, status: :ok, location: $estaffc }
        else
          format.html { render :edit }
          format.json { render json: $estaffc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    def destroy
      $estaffc.destroy
      respond_to do |format|
        format.html { redirect_to myeshop_myeshop_path(id:$eshop), notice: 'Top was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_estaffc
        $eshop = Eshop.where(:id => params[:myeshop_id]).first
        $estaffc = $eshop.estaffcs.where(:id => params[:id]).first
      end
      
      def estaffc_params
        params.require(:estaffc).permit(:eshop_id, :shopname, :user_id, :name)
      end
  end
  