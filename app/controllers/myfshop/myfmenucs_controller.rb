class Myfshop::MyfmenucsController < ApplicationController
  before_action :set_fmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $fshop = Fshop.where(:id => params[:myfshop_id]).first
    $fmenucs = $fshop.fmenucs.all
  end

  def show
    $fshop = Fshop.where(:id => params[:myfshop_id]).first
    $fmenucs = $fshop.fmenucs.all
    render :layout => "menu_category"
  end

  def new
    $fshop = Fshop.where(:id => params[:myfshop_id]).first
    $fmenuc = $fshop.fmenucs.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def subedit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $fshop = Fshop.where(:id => params[:myfshop_id]).first
    $fmenuc = $fshop.fmenucs.build(fmenuc_params)
    $fmenuc.user_id = current_user.id

    respond_to do |format|
      if $fmenuc.save
        format.html { redirect_to myfshop_myfshop_path(id:$fshop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $fmenuc }
      else
        format.html { render :new }
        format.json { render json: $fmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $fmenuc.update(fmenuc_params)
        format.html { redirect_to myfshop_myfshop_path(id:$fshop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $fmenuc }
      else
        format.html { render :edit }
        format.json { render json: $fmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def destroy
    $fmenuc.destroy
    respond_to do |format|
      format.html { redirect_to myfshop_myfshop_path(id:$fshop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_fmenuc
      $fshop = Fshop.where(:id => params[:myfshop_id]).first
      $fmenuc = $fshop.fmenucs.where(:id => params[:id]).first
    end
    
    def fmenuc_params
      params.require(:fmenuc).permit(:fshop_id, :shopname, :user_id, :name, :content)
    end
end
