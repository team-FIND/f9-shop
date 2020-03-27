class Myfshop::MyfstaffsController < ApplicationController
    before_action :set_fstaff, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $fstaffc = Fstaffc.where(:id => params[:myfstaffc_id]).first
      $fstaffs = $fstaffc.fstaffs.all
      render :layout => "menu_category"
    end
  
    def show
      $fstaffc = Fstaffc.where(:id => params[:myfstaffc_id]).first
      $fstaffs = $fstaffc.fstaffs.all
      render :layout => "shop_staff"
    end
  
    def new
      $fstaffc = Fstaffc.where(:id => params[:myfstaffc_id]).first
      $fstaff = $fstaffc.fstaffs.build
      render :layout => "shop/ashop/edit"
    end
  
    def edit
      $fstaff.staff_img.cache! unless $fstaff.staff_img.blank?
      render :layout => "shop/ashop/edit"
    end
  
    def staff_img
      $fstaff.staff_img.cache! unless $fstaff.staff_img.blank? 
      render :layout => "shop/ashop/edit"
    end
  
    def create
      $fstaffc = Fstaffc.where(:id => params[:myfstaffc_id]).first
      $fstaff = $fstaffc.fstaffs.build(fstaff_params)
      $fstaff.user_id = current_user.id
  
      respond_to do |format|
        if $fstaff.save
          format.html { redirect_to myfshop_myfstaffc_myfstaff_path(myfstaffc_id:$fstaffc, id:$fstaff), notice: 'Grand was successfully created.' }
          format.json { render :show, status: :created, location: $fstaff }
        else
          format.html { render :new }
          format.json { render json: $fstaff.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $fstaff.update(fstaff_params)
          format.html { redirect_to myfshop_myfstaffc_myfstaff_path(myfstaffc_id:$fstaffc, id:$fstaff), notice: 'Menu was successfully updated.' }
          format.json { render :show, status: :ok, location: $fstaff }
        else
          format.html { render :edit }
          format.json { render json: $fstaff.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      $fstaff.destroy
      respond_to do |format|
        format.html { redirect_to myfshop_myfstaffc_myfstaffs_path(myfstaffc_id:$fstaffc), notice: 'Menu was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
      def set_fstaff
        $fstaffc = Fstaffc.where(:id => params[:myfstaffc_id]).first
        $fstaff = $fstaffc.fstaffs.where(:id => params[:id]).first
      end
  
      def fstaff_params
        params.require(:fstaff).permit(:fstaffc_id, :user_id, :staff_img, :staff_img_cache, :name, :posittion1, :posittion2, :explain)
      end
  end
  