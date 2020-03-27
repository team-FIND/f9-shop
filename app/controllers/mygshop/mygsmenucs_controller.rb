class Mygshop::MygsmenucsController < ApplicationController
  before_action :set_gsmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $gshop = Gshop.where(:id => params[:mygshop_id]).first
    $gsmenucs = $gshop.gsmenucs.all
  end

  def show
    $gshop = Gshop.where(:id => params[:mygshop_id]).first
    $gsmenucs = $gshop.gsmenucs.all
    render :layout => "menu_category"
  end

  def new
    $gshop = Gshop.where(:id => params[:mygshop_id]).first
    $gsmenuc = $gshop.gsmenucs.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def subedit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $gshop = Gshop.where(:id => params[:mygshop_id]).first
    $gsmenuc = $gshop.gsmenucs.build(gsmenuc_params)
    $gsmenuc.user_id = current_user.id

    respond_to do |format|
      if $gsmenuc.save
        format.html { redirect_to mygshop_mygshop_path(id:$gshop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $gsmenuc }
      else
        format.html { render :new }
        format.json { render json: $gsmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $gsmenuc.update(gsmenuc_params)
        format.html { redirect_to mygshop_mygshop_path(id:$gshop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $gsmenuc }
      else
        format.html { render :edit }
        format.json { render json: $gsmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def destroy
    $gsmenuc.destroy
    respond_to do |format|
      format.html { redirect_to mygshop_mygshop_path(id:$gshop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_gsmenuc
      $gshop = Gshop.where(:id => params[:mygshop_id]).first
      $gsmenuc = $gshop.gsmenucs.where(:id => params[:id]).first
    end
    
    def gsmenuc_params
      params.require(:gsmenuc).permit(:gshop_id, :shopname, :user_id, :name, :price, :detail1, :detail2, :detail3, :detail4, :detail5, :detail6, :detail7, :detail8, :detail9, :detail10)
    end
end
