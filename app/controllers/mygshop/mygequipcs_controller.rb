class Mygshop::MygequipcsController < ApplicationController
    before_action :set_gequipc, only: [:show, :edit, :update, :destroy, :subedit]
    protect_from_forgery except: :create
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def index
      $gshop = Gshop.where(:id => params[:mygshop_id]).first
      $gequipcs = $gshop.gequipcs.all
    end
  
    def show
      redirect_to mygshop_mygequipc_mygequips_path(mygequipc_id:$gequipc)
    end
  
    def new
      $gshop = Gshop.where(:id => params[:mygshop_id]).first
      $gequipc = $gshop.gequipcs.build
      render :layout => "shop/ashop/menu_edit"
    end
  
    def edit
      render :layout => "shop/ashop/menu_edit"
    end
  
    def create
      $gshop = Gshop.where(:id => params[:mygshop_id]).first
      $gequipc = $gshop.gequipcs.build(gequipc_params)
      $gequipc.user_id = current_user.id
  
      respond_to do |format|
        if $gequipc.save
          format.html { redirect_to mygshop_mygshop_path(id:$gshop), notice: 'Acategory was successfully created.' }
          format.json { render :show, status: :created, location: $gequipc }
        else
          format.html { render :new }
          format.json { render json: $gequipc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if $gequipc.update(gequipc_params)
          format.html { redirect_to mygshop_mygshop_path(id:$gshop), notice: 'Acategory was successfully updated.' }
          format.json { render :show, status: :ok, location: $gequipc }
        else
          format.html { render :edit }
          format.json { render json: $gequipc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    def destroy
      $gequipc.destroy
      respond_to do |format|
        format.html { redirect_to mygshop_mygshop_path(id:$gshop), notice: 'Top was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def set_current_user
      @current_user = User.find_by(id: session[:username])
    end
  
    private
  
      def set_gequipc
        $gshop = Gshop.where(:id => params[:mygshop_id]).first
        $gequipc = $gshop.gequipcs.where(:id => params[:id]).first
      end
      
      def gequipc_params
        params.require(:gequipc).permit(:gshop_id, :shopname, :user_id, :name)
      end
      
  end
  