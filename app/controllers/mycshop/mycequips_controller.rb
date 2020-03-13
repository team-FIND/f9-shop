class Mycshop::MycequipsController < ApplicationController
    before_action :set_cequip, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $cequipc = Cequipc.where(:id => params[:mycequipc_id]).first
      $cequips = $cequipc.cequips.all
      render :layout => "menu_category"
    end
  
    def show
      $cequipc = Cequipc.where(:id => params[:mycequipc_id]).first
      $cequips = $cequipc.cequips.all
      render :layout => "shop_equip"
    end
  
    def new
      $cequipc = Cequipc.where(:id => params[:mycequipc_id]).first
      $cequip = $cequipc.cequips.build
      render :layout => "shop/ashop/edit"
    end
  
    def edit
      $cequip.equip_img.cache! unless $cequip.equip_img.blank?
      render :layout => "shop/ashop/edit"
    end
  
    def equip_img
      $cequip.equip_img.cache! unless $cequip.equip_img.blank? 
      render :layout => "shop/ashop/edit"
    end
  
    def create
      $cequipc = Cequipc.where(:id => params[:mycequipc_id]).first
      $cequip = $cequipc.cequips.build(cequip_params)
      $cequip.user_id = current_user.id
  
      respond_to do |format|
        if $cequip.save
          format.html { redirect_to mycshop_mycequipc_mycequip_path(mycequipc_id:$cequipc, id:$cequip), notice: 'Grand was successfully created.' }
          format.json { render :show, status: :created, location: $cequip }
        else
          format.html { render :new }
          format.json { render json: $cequip.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $cequip.update(cequip_params)
          format.html { redirect_to mycshop_mycequipc_mycequip_path(mycequipc_id:$cequipc, id:$cequip), notice: 'Menu was successfully updated.' }
          format.json { render :show, status: :ok, location: $cequip }
        else
          format.html { render :edit }
          format.json { render json: $cequip.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      $cequip.destroy
      respond_to do |format|
        format.html { redirect_to mycshop_mycequipc_mycequips_path(mycequipc_id:$cequipc), notice: 'Menu was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
      def set_cequip
        $cequipc = Cequipc.where(:id => params[:mycequipc_id]).first
        $cequip = $cequipc.cequips.where(:id => params[:id]).first
      end
  
      def cequip_params
        params.require(:cequip).permit(:cequipc_id, :user_id, :equip_img, :equip_img_cache, :name, :explain)
      end
  end
  