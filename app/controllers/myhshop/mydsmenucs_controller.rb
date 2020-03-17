class Mydshop::MydsmenucsController < ApplicationController
  before_action :set_dsmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $dshop = Dshop.where(:id => params[:mydshop_id]).first
    $dsmenucs = $dshop.dsmenucs.all
  end

  def show
    $dshop = Dshop.where(:id => params[:mydshop_id]).first
    $dsmenucs = $dshop.dsmenucs.all
    render :layout => "menu_category"
  end

  def new
    $dshop = Dshop.where(:id => params[:mydshop_id]).first
    $dsmenuc = $dshop.dsmenucs.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def subedit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $dshop = Dshop.where(:id => params[:mydshop_id]).first
    $dsmenuc = $dshop.dsmenucs.build(dsmenuc_params)
    $dsmenuc.user_id = current_user.id

    respond_to do |format|
      if $dsmenuc.save
        format.html { redirect_to mydshop_mydshop_path(id:$dshop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $dsmenuc }
      else
        format.html { render :new }
        format.json { render json: $dsmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $dsmenuc.update(dsmenuc_params)
        format.html { redirect_to mydshop_mydshop_path(id:$dshop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $dsmenuc }
      else
        format.html { render :edit }
        format.json { render json: $dsmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def destroy
    $dsmenuc.destroy
    respond_to do |format|
      format.html { redirect_to mydshop_mydshop_path(id:$dshop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_dsmenuc
      $dshop = Dshop.where(:id => params[:mydshop_id]).first
      $dsmenuc = $dshop.dsmenucs.where(:id => params[:id]).first
    end
    
    def dsmenuc_params
      params.require(:dsmenuc).permit(:dshop_id, :shopname, :user_id, :name, :price, :detail1, :detail2, :detail3, :detail4, :detail5, :detail6, :detail7, :detail8, :detail9, :detail10)
    end
end
