class Myfshop::MyfsmenucsController < ApplicationController
  before_action :set_fsmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $fshop = Fshop.where(:id => params[:myfshop_id]).first
    $fsmenucs = $fshop.fsmenucs.all
  end

  def show
    $fshop = Fshop.where(:id => params[:myfshop_id]).first
    $fsmenucs = $fshop.fsmenucs.all
    render :layout => "menu_category"
  end

  def new
    $fshop = Fshop.where(:id => params[:myfshop_id]).first
    $fsmenuc = $fshop.fsmenucs.build
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
    $fsmenuc = $fshop.fsmenucs.build(fsmenuc_params)
    $fsmenuc.user_id = current_user.id

    respond_to do |format|
      if $fsmenuc.save
        format.html { redirect_to myfshop_myfshop_path(id:$fshop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $fsmenuc }
      else
        format.html { render :new }
        format.json { render json: $fsmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $fsmenuc.update(fsmenuc_params)
        format.html { redirect_to myfshop_myfshop_path(id:$fshop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $fsmenuc }
      else
        format.html { render :edit }
        format.json { render json: $fsmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def destroy
    $fsmenuc.destroy
    respond_to do |format|
      format.html { redirect_to myfshop_myfshop_path(id:$fshop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_fsmenuc
      $fshop = Fshop.where(:id => params[:myfshop_id]).first
      $fsmenuc = $fshop.fsmenucs.where(:id => params[:id]).first
    end
    
    def fsmenuc_params
      params.require(:fsmenuc).permit(:fshop_id, :shopname, :user_id, :name, :price, :detail1, :detail2, :detail3, :detail4, :detail5, :detail6, :detail7, :detail8, :detail9, :detail10)
    end
end
