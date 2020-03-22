class Myeshop::MyesmenucsController < ApplicationController
  before_action :set_esmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $eshop = Eshop.where(:id => params[:myeshop_id]).first
    $esmenucs = $eshop.esmenucs.all
  end

  def show
    $eshop = Eshop.where(:id => params[:myeshop_id]).first
    $esmenucs = $eshop.esmenucs.all
    render :layout => "menu_category"
  end

  def new
    $eshop = Eshop.where(:id => params[:myeshop_id]).first
    $esmenuc = $eshop.esmenucs.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def subedit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $eshop = Eshop.where(:id => params[:myeshop_id]).first
    $esmenuc = $eshop.esmenucs.build(esmenuc_params)
    $esmenuc.user_id = current_user.id

    respond_to do |format|
      if $esmenuc.save
        format.html { redirect_to myeshop_myeshop_path(id:$eshop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $esmenuc }
      else
        format.html { render :new }
        format.json { render json: $esmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $esmenuc.update(esmenuc_params)
        format.html { redirect_to myeshop_myeshop_path(id:$eshop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $esmenuc }
      else
        format.html { render :edit }
        format.json { render json: $esmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def destroy
    $esmenuc.destroy
    respond_to do |format|
      format.html { redirect_to myeshop_myeshop_path(id:$eshop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_esmenuc
      $eshop = Eshop.where(:id => params[:myeshop_id]).first
      $esmenuc = $eshop.esmenucs.where(:id => params[:id]).first
    end
    
    def esmenuc_params
      params.require(:esmenuc).permit(:eshop_id, :shopname, :user_id, :name, :price, :detail1, :detail2, :detail3, :detail4, :detail5, :detail6, :detail7, :detail8, :detail9, :detail10)
    end
end
