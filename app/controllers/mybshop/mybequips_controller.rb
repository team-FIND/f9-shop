class Mybshop::MybequipsController < ApplicationController
    before_action :set_bequip, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $bequipc = Bequipc.where(:id => params[:mybequipc_id]).first
      $bequips = $bequipc.bequips.all
      render :layout => "menu_category"
    end
  
    def show
      $bequipc = Bequipc.where(:id => params[:mybequipc_id]).first
      $bequips = $bequipc.bequips.all
      render :layout => "shop/ashop/bequips"
    end
  
    def new
      $bequipc = Bequipc.where(:id => params[:mybequipc_id]).first
      $bequip = $bequipc.bequips.build
      render :layout => "shop/ashop/edit"
    end
  
    def edit
      $bequip.topimg.cache! unless $bequip.topimg.blank?
      $bequip.bequipimg1.cache! unless $bequip.bequipimg1.blank?
      $bequip.bequipimg2.cache! unless $bequip.bequipimg2.blank?    
      $bequip.bequipimg3.cache! unless $bequip.bequipimg3.blank?   
      render :layout => "shop/ashop/edit"
    end
  
    def bequipimg
      $bequip.topimg.cache! unless $bequip.topimg.blank?
      $bequip.bequipimg1.cache! unless $bequip.bequipimg1.blank?
      $bequip.bequipimg2.cache! unless $bequip.bequipimg2.blank?    
      $bequip.bequipimg3.cache! unless $bequip.bequipimg3.blank?   
      render :layout => "shop/ashop/edit"
    end
  
    def create
      $bequipc = Bequipc.where(:id => params[:mybequipc_id]).first
      $bequip = $bequipc.bequips.build(bequip_params)
      $bequip.user_id = current_user.id
  
      respond_to do |format|
        if $bequip.save
          format.html { redirect_to mybshop_mybequipc_mybequip_path(mybequipc_id:$bequipc, id:$bequip), notice: 'Grand was successfully created.' }
          format.json { render :show, status: :created, location: $bequip }
        else
          format.html { render :new }
          format.json { render json: $bequip.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $bequip.update(bequip_params)
          format.html { redirect_to mybshop_mybequipc_mybequip_path(mybequipc_id:$bequipc, id:$bequip), notice: 'Menu was successfully updated.' }
          format.json { render :show, status: :ok, location: $bequip }
        else
          format.html { render :edit }
          format.json { render json: $bequip.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /menus/1
    # DELETE /menus/1.json
    def destroy
      $bequip.destroy
      respond_to do |format|
        format.html { redirect_to mybshop_mybequipc_mybequips_path(mybequipc_id:$bequipc), notice: 'Menu was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_bequip
        $bequipc = bequipc.where(:id => params[:mybequipc_id]).first
        $bequip = $bequipc.bequips.where(:id => params[:id]).first
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def bequip_params
        params.require(:bequip).permit(:bequipc_id, :name, :topimg, :topimg_cache, :bequipimg1, :bequipimg1_cache, :bequipimg2, :bequipimg2_cache, :bequipimg3, :bequipimg3_cache, :bequipname1, :bequipname2, :price)
      end
  end
  