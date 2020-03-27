class Myfshop::MyfequipsController < ApplicationController
    before_action :set_fequip, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $fequipc = Fequipc.where(:id => params[:myfequipc_id]).first
      $fequips = $fequipc.fequips.all
      render :layout => "menu_category"
    end
  
    def show
      $fequipc = Fequipc.where(:id => params[:myfequipc_id]).first
      $fequips = $fequipc.fequips.all
      render :layout => "shop_equip"
    end
  
    def new
      $fequipc = Fequipc.where(:id => params[:myfequipc_id]).first
      $fequip = $fequipc.fequips.build
      render :layout => "shop/ashop/edit"
    end
  
    def edit
      $fequip.equip_img.cache! unless $fequip.equip_img.blank?
      render :layout => "shop/ashop/edit"
    end
  
    def equip_img
      $fequip.equip_img.cache! unless $fequip.equip_img.blank? 
      render :layout => "shop/ashop/edit"
    end
  
    def create
      $fequipc = Fequipc.where(:id => params[:myfequipc_id]).first
      $fequip = $fequipc.fequips.build(fequip_params)
      $fequip.user_id = current_user.id
  
      respond_to do |format|
        if $fequip.save
          format.html { redirect_to myfshop_myfequipc_myfequip_path(myfequipc_id:$fequipc, id:$fequip), notice: 'Grand was successfully created.' }
          format.json { render :show, status: :created, location: $fequip }
        else
          format.html { render :new }
          format.json { render json: $fequip.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $fequip.update(fequip_params)
          format.html { redirect_to myfshop_myfequipc_myfequip_path(myfequipc_id:$fequipc, id:$fequip), notice: 'Menu was successfully updated.' }
          format.json { render :show, status: :ok, location: $fequip }
        else
          format.html { render :edit }
          format.json { render json: $fequip.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      $fequip.destroy
      respond_to do |format|
        format.html { redirect_to myfshop_myfequipc_myfequips_path(myfequipc_id:$fequipc), notice: 'Menu was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
      def set_fequip
        $fequipc = Fequipc.where(:id => params[:myfequipc_id]).first
        $fequip = $fequipc.fequips.where(:id => params[:id]).first
      end
  
      def fequip_params
        params.require(:fequip).permit(:fequipc_id, :user_id, :equip_img, :equip_img_cache, :name, :explain)
      end
  end
  