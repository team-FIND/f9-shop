class Mydshop::MydequipsController < ApplicationController
    before_action :set_dequip, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $dequipc = Dequipc.where(:id => params[:mydequipc_id]).first
      $dequips = $dequipc.dequips.all
      render :layout => "menu_category"
    end
  
    def show
      $dequipc = Dequipc.where(:id => params[:mydequipc_id]).first
      $dequips = $dequipc.dequips.all
      render :layout => "shop_equip"
    end
  
    def new
      $dequipc = Dequipc.where(:id => params[:mydequipc_id]).first
      $dequip = $dequipc.dequips.build
      render :layout => "shop/ashop/edit"
    end
  
    def edit
      $dequip.equip_img.cache! unless $dequip.equip_img.blank?
      render :layout => "shop/ashop/edit"
    end
  
    def equip_img
      $dequip.equip_img.cache! unless $dequip.equip_img.blank? 
      render :layout => "shop/ashop/edit"
    end
  
    def create
      $dequipc = Dequipc.where(:id => params[:mydequipc_id]).first
      $dequip = $dequipc.dequips.build(dequip_params)
      $dequip.user_id = current_user.id
  
      respond_to do |format|
        if $dequip.save
          format.html { redirect_to mydshop_mydequipc_mydequip_path(mydequipc_id:$dequipc, id:$dequip), notice: 'Grand was successfully created.' }
          format.json { render :show, status: :created, location: $dequip }
        else
          format.html { render :new }
          format.json { render json: $dequip.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $dequip.update(dequip_params)
          format.html { redirect_to mydshop_mydequipc_mydequip_path(mydequipc_id:$dequipc, id:$dequip), notice: 'Menu was successfully updated.' }
          format.json { render :show, status: :ok, location: $dequip }
        else
          format.html { render :edit }
          format.json { render json: $dequip.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      $dequip.destroy
      respond_to do |format|
        format.html { redirect_to mydshop_mydequipc_mydequips_path(mydequipc_id:$dequipc), notice: 'Menu was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
      def set_dequip
        $dequipc = Dequipc.where(:id => params[:mydequipc_id]).first
        $dequip = $dequipc.dequips.where(:id => params[:id]).first
      end
  
      def dequip_params
        params.require(:dequip).permit(:dequipc_id, :user_id, :equip_img, :equip_img_cache, :name, :explain)
      end
  end
  