class Myhshop::MyhequipsController < ApplicationController
    before_action :set_hequip, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $hequipc = Hequipc.where(:id => params[:myhequipc_id]).first
      $hequips = $hequipc.hequips.all
      render :layout => "menu_category"
    end
  
    def show
      $hequipc = Hequipc.where(:id => params[:myhequipc_id]).first
      $hequips = $hequipc.hequips.all
      render :layout => "shop_equip"
    end
  
    def new
      $hequipc = Hequipc.where(:id => params[:myhequipc_id]).first
      $hequip = $hequipc.hequips.build
      render :layout => "shop/ashop/edit"
    end
  
    def edit
      $hequip.equip_img.cache! unless $hequip.equip_img.blank?
      render :layout => "shop/ashop/edit"
    end
  
    def equip_img
      $hequip.equip_img.cache! unless $hequip.equip_img.blank? 
      render :layout => "shop/ashop/edit"
    end
  
    def create
      $hequipc = Hequipc.where(:id => params[:myhequipc_id]).first
      $hequip = $hequipc.hequips.build(hequip_params)
      $hequip.user_id = current_user.id
  
      respond_to do |format|
        if $hequip.save
          format.html { redirect_to myhshop_myhequipc_myhequip_path(myhequipc_id:$hequipc, id:$hequip), notice: 'Grand was successfully created.' }
          format.json { render :show, status: :created, location: $hequip }
        else
          format.html { render :new }
          format.json { render json: $hequip.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $hequip.update(hequip_params)
          format.html { redirect_to myhshop_myhequipc_myhequip_path(myhequipc_id:$hequipc, id:$hequip), notice: 'Menu was successfully updated.' }
          format.json { render :show, status: :ok, location: $hequip }
        else
          format.html { render :edit }
          format.json { render json: $hequip.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      $hequip.destroy
      respond_to do |format|
        format.html { redirect_to myhshop_myhequipc_myhequips_path(myhequipc_id:$hequipc), notice: 'Menu was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
      def set_hequip
        $hequipc = Hequipc.where(:id => params[:myhequipc_id]).first
        $hequip = $hequipc.hequips.where(:id => params[:id]).first
      end
  
      def hequip_params
        params.require(:hequip).permit(:hequipc_id, :user_id, :equip_img, :equip_img_cache, :name, :explain)
      end
  end
  