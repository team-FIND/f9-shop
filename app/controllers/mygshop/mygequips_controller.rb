class Mygshop::MygequipsController < ApplicationController
    before_action :set_gequip, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $gequipc = Gequipc.where(:id => params[:mygequipc_id]).first
      $gequips = $gequipc.gequips.all
      render :layout => "menu_category"
    end
  
    def show
      $gequipc = Gequipc.where(:id => params[:mygequipc_id]).first
      $gequips = $gequipc.gequips.all
      render :layout => "shop_equip"
    end
  
    def new
      $gequipc = Gequipc.where(:id => params[:mygequipc_id]).first
      $gequip = $gequipc.gequips.build
      render :layout => "shop/ashop/edit"
    end
  
    def edit
      $gequip.equip_img.cache! unless $gequip.equip_img.blank?
      render :layout => "shop/ashop/edit"
    end
  
    def equip_img
      $gequip.equip_img.cache! unless $gequip.equip_img.blank? 
      render :layout => "shop/ashop/edit"
    end
  
    def create
      $gequipc = Gequipc.where(:id => params[:mygequipc_id]).first
      $gequip = $gequipc.gequips.build(gequip_params)
      $gequip.user_id = current_user.id
  
      respond_to do |format|
        if $gequip.save
          format.html { redirect_to mygshop_mygequipc_mygequip_path(mygequipc_id:$gequipc, id:$gequip), notice: 'Grand was successfully created.' }
          format.json { render :show, status: :created, location: $gequip }
        else
          format.html { render :new }
          format.json { render json: $gequip.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $gequip.update(gequip_params)
          format.html { redirect_to mygshop_mygequipc_mygequip_path(mygequipc_id:$gequipc, id:$gequip), notice: 'Menu was successfully updated.' }
          format.json { render :show, status: :ok, location: $gequip }
        else
          format.html { render :edit }
          format.json { render json: $gequip.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      $gequip.destroy
      respond_to do |format|
        format.html { redirect_to mygshop_mygequipc_mygequips_path(mygequipc_id:$gequipc), notice: 'Menu was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
      def set_gequip
        $gequipc = Gequipc.where(:id => params[:mygequipc_id]).first
        $gequip = $gequipc.gequips.where(:id => params[:id]).first
      end
  
      def gequip_params
        params.require(:gequip).permit(:gequipc_id, :user_id, :equip_img, :equip_img_cache, :name, :explain)
      end
  end
  