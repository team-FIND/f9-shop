class Mybshop::MybstaffsController < ApplicationController
    before_action :set_bstaff, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $bstaffc = Bstaffc.where(:id => params[:mybstaffc_id]).first
      $bstaffs = $bstaffc.bstaffs.all
      render :layout => "menu_category"
    end
  
    def show
      $bstaffc = Bstaffc.where(:id => params[:mybstaffc_id]).first
      $bstaffs = $bstaffc.bstaffs.all
      render :layout => "shop_staff"
    end
  
    def new
      $bstaffc = Bstaffc.where(:id => params[:mybstaffc_id]).first
      $bstaff = $bstaffc.bstaffs.build
      render :layout => "shop/ashop/edit"
    end
  
    def edit
      $bstaff.staff_img.cache! unless $bstaff.staff_img.blank?
      render :layout => "shop/ashop/edit"
    end
  
    def staff_img
      $bstaff.staff_img.cache! unless $bstaff.staff_img.blank? 
      render :layout => "shop/ashop/edit"
    end
  
    def create
      $bstaffc = Bstaffc.where(:id => params[:mybstaffc_id]).first
      $bstaff = $bstaffc.bstaffs.build(bstaff_params)
      $bstaff.user_id = current_user.id
  
      respond_to do |format|
        if $bstaff.save
          format.html { redirect_to mybshop_mybstaffc_mybstaff_path(mybstaffc_id:$bstaffc, id:$bstaff), notice: 'Grand was successfully created.' }
          format.json { render :show, status: :created, location: $bstaff }
        else
          format.html { render :new }
          format.json { render json: $bstaff.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $bstaff.update(bstaff_params)
          format.html { redirect_to mybshop_mybstaffc_mybstaff_path(mybstaffc_id:$bstaffc, id:$bstaff), notice: 'Menu was successfully updated.' }
          format.json { render :show, status: :ok, location: $bstaff }
        else
          format.html { render :edit }
          format.json { render json: $bstaff.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      $bstaff.destroy
      respond_to do |format|
        format.html { redirect_to mybshop_mybstaffc_mybstaffs_path(mybstaffc_id:$bstaffc), notice: 'Menu was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
      def set_bstaff
        $bstaffc = Bstaffc.where(:id => params[:mybstaffc_id]).first
        $bstaff = $bstaffc.bstaffs.where(:id => params[:id]).first
      end
  
      def bstaff_params
        params.require(:bstaff).permit(:bstaffc_id, :user_id, :staff_img, :staff_img_cache, :name, :posittion1, :posittion2, :explain)
      end
  end
  