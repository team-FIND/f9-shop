class Mycshop::MycstaffsController < ApplicationController
    before_action :set_cstaff, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $cstaffc = Cstaffc.where(:id => params[:mycstaffc_id]).first
      $cstaffs = $cstaffc.cstaffs.all
      render :layout => "menu_category"
    end
  
    def show
      $cstaffc = Cstaffc.where(:id => params[:mycstaffc_id]).first
      $cstaffs = $cstaffc.cstaffs.all
      render :layout => "shop_staff"
    end
  
    def new
      $cstaffc = Cstaffc.where(:id => params[:mycstaffc_id]).first
      $cstaff = $cstaffc.cstaffs.build
      render :layout => "shop/ashop/edit"
    end
  
    def edit
      $cstaff.staff_img.cache! unless $cstaff.staff_img.blank?
      render :layout => "shop/ashop/edit"
    end
  
    def staff_img
      $cstaff.staff_img.cache! unless $cstaff.staff_img.blank? 
      render :layout => "shop/ashop/edit"
    end
  
    def create
      $cstaffc = Cstaffc.where(:id => params[:mycstaffc_id]).first
      $cstaff = $cstaffc.cstaffs.build(cstaff_params)
      $cstaff.user_id = current_user.id
  
      respond_to do |format|
        if $cstaff.save
          format.html { redirect_to mycshop_mycstaffc_mycstaff_path(mycstaffc_id:$cstaffc, id:$cstaff), notice: 'Grand was successfully created.' }
          format.json { render :show, status: :created, location: $cstaff }
        else
          format.html { render :new }
          format.json { render json: $cstaff.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $cstaff.update(cstaff_params)
          format.html { redirect_to mycshop_mycstaffc_mycstaff_path(mycstaffc_id:$cstaffc, id:$cstaff), notice: 'Menu was successfully updated.' }
          format.json { render :show, status: :ok, location: $cstaff }
        else
          format.html { render :edit }
          format.json { render json: $cstaff.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      $cstaff.destroy
      respond_to do |format|
        format.html { redirect_to mycshop_mycstaffc_mycstaffs_path(mycstaffc_id:$cstaffc), notice: 'Menu was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
      def set_cstaff
        $cstaffc = Cstaffc.where(:id => params[:mycstaffc_id]).first
        $cstaff = $cstaffc.cstaffs.where(:id => params[:id]).first
      end
  
      def cstaff_params
        params.require(:cstaff).permit(:cstaffc_id, :user_id, :staff_img, :staff_img_cache, :name, :posittion1, :posittion2, :explain)
      end
  end
  