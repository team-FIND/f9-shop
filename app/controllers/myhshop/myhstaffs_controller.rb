class Myhshop::MyhstaffsController < ApplicationController
    before_action :set_hstaff, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $hstaffc = Hstaffc.where(:id => params[:myhstaffc_id]).first
      $hstaffs = $hstaffc.hstaffs.all
      render :layout => "menu_category"
    end
  
    def show
      $hstaffc = Hstaffc.where(:id => params[:myhstaffc_id]).first
      $hstaffs = $hstaffc.hstaffs.all
      render :layout => "shop_staff"
    end
  
    def new
      $hstaffc = Hstaffc.where(:id => params[:myhstaffc_id]).first
      $hstaff = $hstaffc.hstaffs.build
      render :layout => "shop/ashop/edit"
    end
  
    def edit
      $hstaff.staff_img.cache! unless $hstaff.staff_img.blank?
      render :layout => "shop/ashop/edit"
    end
  
    def staff_img
      $hstaff.staff_img.cache! unless $hstaff.staff_img.blank? 
      render :layout => "shop/ashop/edit"
    end
  
    def create
      $hstaffc = Hstaffc.where(:id => params[:myhstaffc_id]).first
      $hstaff = $hstaffc.hstaffs.build(hstaff_params)
      $hstaff.user_id = current_user.id
  
      respond_to do |format|
        if $hstaff.save
          format.html { redirect_to myhshop_myhstaffc_myhstaff_path(myhstaffc_id:$hstaffc, id:$hstaff), notice: 'Grand was successfully created.' }
          format.json { render :show, status: :created, location: $hstaff }
        else
          format.html { render :new }
          format.json { render json: $hstaff.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $hstaff.update(hstaff_params)
          format.html { redirect_to myhshop_myhstaffc_myhstaff_path(myhstaffc_id:$hstaffc, id:$hstaff), notice: 'Menu was successfully updated.' }
          format.json { render :show, status: :ok, location: $hstaff }
        else
          format.html { render :edit }
          format.json { render json: $hstaff.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      $hstaff.destroy
      respond_to do |format|
        format.html { redirect_to myhshop_myhstaffc_myhstaffs_path(myhstaffc_id:$hstaffc), notice: 'Menu was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
      def set_hstaff
        $hstaffc = Hstaffc.where(:id => params[:myhstaffc_id]).first
        $hstaff = $hstaffc.hstaffs.where(:id => params[:id]).first
      end
  
      def hstaff_params
        params.require(:hstaff).permit(:hstaffc_id, :user_id, :staff_img, :staff_img_cache, :name, :posittion1, :posittion2, :explain)
      end
  end
  