class Mybshop::MybsmenucsController < ApplicationController
  before_action :set_bsmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $bshop = Bshop.where(:id => params[:mybshop_id]).first
    $bsmenucs = $bshop.bsmenucs.all
  end

  def show
    $bshop = Bshop.where(:id => params[:mybshop_id]).first
    $bsmenucs = $bshop.bsmenucs.all
    render :layout => "shop/ashop/contents"
  end

  def new
    $bshop = Bshop.where(:id => params[:mybshop_id]).first
    $bsmenuc = $bshop.bsmenucs.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def subedit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $bshop = Bshop.where(:id => params[:mybshop_id]).first
    $bsmenuc = $bshop.bsmenucs.build(bsmenuc_params)
    $bsmenuc.user_id = current_user.id

    respond_to do |format|
      if $bsmenuc.save
        format.html { redirect_to mybshop_mybshop_path(id:$bshop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $bsmenuc }
      else
        format.html { render :new }
        format.json { render json: $bsmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $bsmenuc.update(bsmenuc_params)
        format.html { redirect_to mybshop_mybshop_path(id:$bshop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $bsmenuc }
      else
        format.html { render :edit }
        format.json { render json: $bsmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def destroy
    $bsmenuc.destroy
    respond_to do |format|
      format.html { redirect_to mybshop_mybshop_path(id:$bshop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_bsmenuc
      $bshop = Bshop.where(:id => params[:mybshop_id]).first
      $bsmenuc = $bshop.bsmenucs.where(:id => params[:id]).first
    end
    
    def bsmenuc_params
      params.require(:bsmenuc).permit(:bshop_id, :shopname, :user_id, :name, :price, :detail1, :detail2, :detail3, :detail4, :detail5, :detail6, :detail7, :detail8, :detail9, :detail10)
    end
end
