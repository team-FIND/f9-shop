class Mycshop::MycsmenucsController < ApplicationController
  before_action :set_csmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $cshop = Cshop.where(:id => params[:mycshop_id]).first
    $csmenucs = $cshop.csmenucs.all
  end

  def show
    $cshop = Cshop.where(:id => params[:mycshop_id]).first
    $csmenucs = $cshop.csmenucs.all
    render :layout => "menu_category"
  end

  def new
    $cshop = Cshop.where(:id => params[:mycshop_id]).first
    $csmenuc = $cshop.csmenucs.build
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
    $csmenuc = $cshop.csmenucs.build(csmenuc_params)
    $csmenuc.user_id = current_user.id

    respond_to do |format|
      if $csmenuc.save
        format.html { redirect_to mycshop_mycshop_path(id:$cshop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $csmenuc }
      else
        format.html { render :new }
        format.json { render json: $csmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $csmenuc.update(csmenuc_params)
        format.html { redirect_to mycshop_mycshop_path(id:$cshop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $csmenuc }
      else
        format.html { render :edit }
        format.json { render json: $csmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $csmenuc.destroy
    respond_to do |format|
      format.html { redirect_to mycshop_mycshop_path(id:$cshop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_csmenuc
      $cshop = Cshop.where(:id => params[:mycshop_id]).first
      $csmenuc = $cshop.csmenucs.where(:id => params[:id]).first
    end
    
    def csmenuc_params
      params.require(:csmenuc).permit(:cshop_id, :shopname, :user_id, :name, :price, :detail1, :detail2, :detail3, :detail4, :detail5, :detail6, :detail7, :detail8, :detail9, :detail10)
    end
end
