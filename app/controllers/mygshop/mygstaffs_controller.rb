class Mygshop::MygstaffsController < ApplicationController
    before_action :set_gstaff, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $gstaffc = Gstaffc.where(:id => params[:mygstaffc_id]).first
      $gstaffs = $gstaffc.gstaffs.all
      render :layout => "menu_category"
    end
  
    def show
      $gstaffc = Gstaffc.where(:id => params[:mygstaffc_id]).first
      $gstaffs = $gstaffc.gstaffs.all
      render :layout => "shop_staff"
    end
  
    def new
      $gstaffc = Gstaffc.where(:id => params[:mygstaffc_id]).first
      $gstaff = $gstaffc.gstaffs.build
      render :layout => "shop/ashop/edit"
    end
  
    def edit
      $gstaff.staff_img.cache! unless $gstaff.staff_img.blank?
      render :layout => "shop/ashop/edit"
    end
  
    def staff_img
      $gstaff.staff_img.cache! unless $gstaff.staff_img.blank? 
      render :layout => "shop/ashop/edit"
    end
  
    def create
      $gstaffc = Gstaffc.where(:id => params[:mygstaffc_id]).first
      $gstaff = $gstaffc.gstaffs.build(gstaff_params)
      $gstaff.user_id = current_user.id
  
      respond_to do |format|
        if $gstaff.save
          format.html { redirect_to mygshop_mygstaffc_mygstaff_path(mygstaffc_id:$gstaffc, id:$gstaff), notice: 'Grand was successfully created.' }
          format.json { render :show, status: :created, location: $gstaff }
        else
          format.html { render :new }
          format.json { render json: $gstaff.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $gstaff.update(gstaff_params)
          format.html { redirect_to mygshop_mygstaffc_mygstaff_path(mygstaffc_id:$gstaffc, id:$gstaff), notice: 'Menu was successfully updated.' }
          format.json { render :show, status: :ok, location: $gstaff }
        else
          format.html { render :edit }
          format.json { render json: $gstaff.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      $gstaff.destroy
      respond_to do |format|
        format.html { redirect_to mygshop_mygstaffc_mygstaffs_path(mygstaffc_id:$gstaffc), notice: 'Menu was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
      def set_gstaff
        $gstaffc = Gstaffc.where(:id => params[:mygstaffc_id]).first
        $gstaff = $gstaffc.gstaffs.where(:id => params[:id]).first
      end
  
      def gstaff_params
        params.require(:gstaff).permit(:gstaffc_id, :user_id, :staff_img, :staff_img_cache, :name, :posittion1, :posittion2, :explain)
      end
  end
  