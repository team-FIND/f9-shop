class Myhshop::MyhsmenucsController < ApplicationController
  before_action :set_hsmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $hshop = Hshop.where(:id => params[:myhshop_id]).first
    $hsmenucs = $hshop.hsmenucs.all
  end

  def show
    $hshop = Hshop.where(:id => params[:myhshop_id]).first
    $hsmenucs = $hshop.hsmenucs.all
    render :layout => "menu_category"
  end

  def new
    $hshop = Hshop.where(:id => params[:myhshop_id]).first
    $hsmenuc = $hshop.hsmenucs.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def subedit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $hshop = Hshop.where(:id => params[:myhshop_id]).first
    $hsmenuc = $hshop.hsmenucs.build(hsmenuc_params)
    $hsmenuc.user_id = current_user.id

    respond_to do |format|
      if $hsmenuc.save
        format.html { redirect_to myhshop_myhshop_path(id:$hshop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $hsmenuc }
      else
        format.html { render :new }
        format.json { render json: $hsmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $hsmenuc.update(hsmenuc_params)
        format.html { redirect_to myhshop_myhshop_path(id:$hshop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $hsmenuc }
      else
        format.html { render :edit }
        format.json { render json: $hsmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def destroy
    $hsmenuc.destroy
    respond_to do |format|
      format.html { redirect_to myhshop_myhshop_path(id:$hshop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_hsmenuc
      $hshop = Hshop.where(:id => params[:myhshop_id]).first
      $hsmenuc = $hshop.hsmenucs.where(:id => params[:id]).first
    end
    
    def hsmenuc_params
      params.require(:hsmenuc).permit(:hshop_id, :shopname, :user_id, :name, :price, :detail1, :detail2, :detail3, :detail4, :detail5, :detail6, :detail7, :detail8, :detail9, :detail10)
    end
end
