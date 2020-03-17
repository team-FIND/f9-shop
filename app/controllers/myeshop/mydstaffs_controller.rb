class Mydshop::MydstaffsController < ApplicationController
    before_action :set_dstaff, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $dstaffc = Dstaffc.where(:id => params[:mydstaffc_id]).first
      $dstaffs = $dstaffc.dstaffs.all
      render :layout => "menu_category"
    end
  
    def show
      $dstaffc = Dstaffc.where(:id => params[:mydstaffc_id]).first
      $dstaffs = $dstaffc.dstaffs.all
      render :layout => "shop_staff"
    end
  
    def new
      $dstaffc = Dstaffc.where(:id => params[:mydstaffc_id]).first
      $dstaff = $dstaffc.dstaffs.build
      render :layout => "shop/ashop/edit"
    end
  
    def edit
      $dstaff.staff_img.cache! unless $dstaff.staff_img.blank?
      render :layout => "shop/ashop/edit"
    end
  
    def staff_img
      $dstaff.staff_img.cache! unless $dstaff.staff_img.blank? 
      render :layout => "shop/ashop/edit"
    end
  
    def create
      $dstaffc = Dstaffc.where(:id => params[:mydstaffc_id]).first
      $dstaff = $dstaffc.dstaffs.build(dstaff_params)
      $dstaff.user_id = current_user.id
  
      respond_to do |format|
        if $dstaff.save
          format.html { redirect_to mydshop_mydstaffc_mydstaff_path(mydstaffc_id:$dstaffc, id:$dstaff), notice: 'Grand was successfully created.' }
          format.json { render :show, status: :created, location: $dstaff }
        else
          format.html { render :new }
          format.json { render json: $dstaff.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $dstaff.update(dstaff_params)
          format.html { redirect_to mydshop_mydstaffc_mydstaff_path(mydstaffc_id:$dstaffc, id:$dstaff), notice: 'Menu was successfully updated.' }
          format.json { render :show, status: :ok, location: $dstaff }
        else
          format.html { render :edit }
          format.json { render json: $dstaff.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      $dstaff.destroy
      respond_to do |format|
        format.html { redirect_to mydshop_mydstaffc_mydstaffs_path(mydstaffc_id:$dstaffc), notice: 'Menu was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
      def set_dstaff
        $dstaffc = Dstaffc.where(:id => params[:mydstaffc_id]).first
        $dstaff = $dstaffc.dstaffs.where(:id => params[:id]).first
      end
  
      def dstaff_params
        params.require(:dstaff).permit(:dstaffc_id, :user_id, :staff_img, :staff_img_cache, :name, :posittion1, :posittion2, :explain)
      end
  end
  