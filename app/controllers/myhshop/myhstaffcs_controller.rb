class Myhshop::MyhstaffcsController < ApplicationController
    before_action :set_hstaffc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $hshop = Hshop.where(:id => params[:myhshop_id]).first
      $hstaffcs = $hshop.hstaffcs.all
    end
  
    def show
      redirect_to myhshop_myhstaffc_myhstaffs_path(myhstaffc_id:$hstaffc)
    end
  
    def new
      $hshop = Hshop.where(:id => params[:myhshop_id]).first
      $hstaffc = $hshop.hstaffcs.build
      render :layout => "shop/ashop/menu_edit"
    end
  
    def edit
      render :layout => "shop/ashop/menu_edit"
    end
  
    def create
      $hshop = Hshop.where(:id => params[:myhshop_id]).first
      $hstaffc = $hshop.hstaffcs.build(hstaffc_params)
      $hstaffc.user_id = current_user.id
  
      respond_to do |format|
        if $hstaffc.save
          format.html { redirect_to myhshop_myhshop_path(id:$hshop), notice: 'Acategory was successfully created.' }
          format.json { render :show, status: :created, location: $hstaffc }
        else
          format.html { render :new }
          format.json { render json: $hstaffc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $hstaffc.update(hstaffc_params)
          format.html { redirect_to myhshop_myhshop_path(id:$hshop), notice: 'Acategory was successfully updated.' }
          format.json { render :show, status: :ok, location: $hstaffc }
        else
          format.html { render :edit }
          format.json { render json: $hstaffc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    def destroy
      $hstaffc.destroy
      respond_to do |format|
        format.html { redirect_to myhshop_myhshop_path(id:$hshop), notice: 'Top was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_hstaffc
        $hshop = Hshop.where(:id => params[:myhshop_id]).first
        $hstaffc = $hshop.hstaffcs.where(:id => params[:id]).first
      end
      
      def hstaffc_params
        params.require(:hstaffc).permit(:hshop_id, :shopname, :user_id, :name)
      end
  end
  