class Myeshop::MyestaffsController < ApplicationController
    before_action :set_estaff, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $estaffc = Estaffc.where(:id => params[:myestaffc_id]).first
      $estaffs = $estaffc.estaffs.all
      render :layout => "menu_category"
    end
  
    def show
      $estaffc = Estaffc.where(:id => params[:myestaffc_id]).first
      $estaffs = $estaffc.estaffs.all
      render :layout => "shop_staff"
    end
  
    def new
      $estaffc = Estaffc.where(:id => params[:myestaffc_id]).first
      $estaff = $estaffc.estaffs.build
      render :layout => "shop/ashop/edit"
    end
  
    def edit
      $estaff.staff_img.cache! unless $estaff.staff_img.blank?
      render :layout => "shop/ashop/edit"
    end
  
    def staff_img
      $estaff.staff_img.cache! unless $estaff.staff_img.blank? 
      render :layout => "shop/ashop/edit"
    end
  
    def create
      $estaffc = Estaffc.where(:id => params[:myestaffc_id]).first
      $estaff = $estaffc.estaffs.build(estaff_params)
      $estaff.user_id = current_user.id
  
      respond_to do |format|
        if $estaff.save
          format.html { redirect_to myeshop_myestaffc_myestaff_path(myestaffc_id:$estaffc, id:$estaff), notice: 'Grand was successfully created.' }
          format.json { render :show, status: :created, location: $estaff }
        else
          format.html { render :new }
          format.json { render json: $estaff.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $estaff.update(estaff_params)
          format.html { redirect_to myeshop_myestaffc_myestaff_path(myestaffc_id:$estaffc, id:$estaff), notice: 'Menu was successfully updated.' }
          format.json { render :show, status: :ok, location: $estaff }
        else
          format.html { render :edit }
          format.json { render json: $estaff.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      $estaff.destroy
      respond_to do |format|
        format.html { redirect_to myeshop_myestaffc_myestaffs_path(myestaffc_id:$estaffc), notice: 'Menu was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
      def set_estaff
        $estaffc = Estaffc.where(:id => params[:myestaffc_id]).first
        $estaff = $estaffc.estaffs.where(:id => params[:id]).first
      end
  
      def estaff_params
        params.require(:estaff).permit(:estaffc_id, :user_id, :staff_img, :staff_img_cache, :name, :posittion1, :posittion2, :explain)
      end
  end
  