class Myeshop::MyeequipsController < ApplicationController
    before_action :set_eequip, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $eequipc = Eequipc.where(:id => params[:myeequipc_id]).first
      $eequips = $eequipc.eequips.all
      render :layout => "menu_category"
    end
  
    def show
      $eequipc = Eequipc.where(:id => params[:myeequipc_id]).first
      $eequips = $eequipc.eequips.all
      render :layout => "shop_equip"
    end
  
    def new
      $eequipc = Eequipc.where(:id => params[:myeequipc_id]).first
      $eequip = $eequipc.eequips.build
      render :layout => "shop/ashop/edit"
    end
  
    def edit
      $eequip.equip_img.cache! unless $eequip.equip_img.blank?
      render :layout => "shop/ashop/edit"
    end
  
    def equip_img
      $eequip.equip_img.cache! unless $eequip.equip_img.blank? 
      render :layout => "shop/ashop/edit"
    end
  
    def create
      $eequipc = Eequipc.where(:id => params[:myeequipc_id]).first
      $eequip = $eequipc.eequips.build(eequip_params)
      $eequip.user_id = current_user.id
  
      respond_to do |format|
        if $eequip.save
          format.html { redirect_to myeshop_myeequipc_myeequip_path(myeequipc_id:$eequipc, id:$eequip), notice: 'Grand was successfully created.' }
          format.json { render :show, status: :created, location: $eequip }
        else
          format.html { render :new }
          format.json { render json: $eequip.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $eequip.update(eequip_params)
          format.html { redirect_to myeshop_myeequipc_myeequip_path(myeequipc_id:$eequipc, id:$eequip), notice: 'Menu was successfully updated.' }
          format.json { render :show, status: :ok, location: $eequip }
        else
          format.html { render :edit }
          format.json { render json: $eequip.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      $eequip.destroy
      respond_to do |format|
        format.html { redirect_to myeshop_myeequipc_myeequips_path(myeequipc_id:$eequipc), notice: 'Menu was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
      def set_eequip
        $eequipc = Eequipc.where(:id => params[:myeequipc_id]).first
        $eequip = $eequipc.eequips.where(:id => params[:id]).first
      end
  
      def eequip_params
        params.require(:eequip).permit(:eequipc_id, :user_id, :equip_img, :equip_img_cache, :name, :explain)
      end
  end
  