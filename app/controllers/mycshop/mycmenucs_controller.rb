class Mycshop::MycmenucsController < ApplicationController
  before_action :set_cmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $cshop = Cshop.where(:id => params[:mycshop_id]).first
    $cmenucs = $cshop.cmenucs.all
  end

  def show
    $cshop = Cshop.where(:id => params[:mycshop_id]).first
    $cmenucs = $cshop.cmenucs.all
    render :layout => "menu_category"
  end

  def new
    $cshop = Cshop.where(:id => params[:mycshop_id]).first
    $cmenuc = $cshop.cmenucs.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def subedit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $cshop = Cshop.where(:id => params[:mycshop_id]).first
    $cmenuc = $cshop.cmenucs.build(cmenuc_params)
    $cmenuc.user_id = current_user.id

    respond_to do |format|
      if $cmenuc.save
        format.html { redirect_to mycshop_mycshop_path(id:$cshop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $cmenuc }
      else
        format.html { render :new }
        format.json { render json: $cmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $cmenuc.update(cmenuc_params)
        format.html { redirect_to mycshop_mycshop_path(id:$cshop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $cmenuc }
      else
        format.html { render :edit }
        format.json { render json: $cmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def destroy
    $cmenuc.destroy
    respond_to do |format|
      format.html { redirect_to mycshop_mycshop_path(id:$cshop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_cmenuc
      $cshop = Cshop.where(:id => params[:mycshop_id]).first
      $cmenuc = $cshop.cmenucs.where(:id => params[:id]).first
    end
    
    def cmenuc_params
      params.require(:cmenuc).permit(:cshop_id, :shopname, :user_id, :name, :price, :detail1, :detail2, :detail3, :detail4, :detail5, :detail6, :detail7, :detail8, :detail9, :detail10)
    end
end
