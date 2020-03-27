class Mygshop::MygmenucsController < ApplicationController
  before_action :set_gmenuc, only: [:show, :edit, :update, :destroy, :subedit]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $gshop = Gshop.where(:id => params[:mygshop_id]).first
    $gmenucs = $gshop.gmenucs.all
  end

  def show
    $gshop = Gshop.where(:id => params[:mygshop_id]).first
    $gmenucs = $gshop.gmenucs.all
    render :layout => "menu_category"
  end

  def new
    $gshop = Gshop.where(:id => params[:mygshop_id]).first
    $gmenuc = $gshop.gmenucs.build
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
    $gmenuc = $gshop.gmenucs.build(gmenuc_params)
    $gmenuc.user_id = current_user.id

    respond_to do |format|
      if $gmenuc.save
        format.html { redirect_to mygshop_mygshop_path(id:$gshop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $gmenuc }
      else
        format.html { render :new }
        format.json { render json: $gmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $gmenuc.update(gmenuc_params)
        format.html { redirect_to mygshop_mygshop_path(id:$gshop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $gmenuc }
      else
        format.html { render :edit }
        format.json { render json: $gmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def destroy
    $gmenuc.destroy
    respond_to do |format|
      format.html { redirect_to mygshop_mygshop_path(id:$gshop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_gmenuc
      $gshop = Gshop.where(:id => params[:mygshop_id]).first
      $gmenuc = $gshop.gmenucs.where(:id => params[:id]).first
    end
    
    def gmenuc_params
      params.require(:gmenuc).permit(:gshop_id, :shopname, :user_id, :name, :content)
    end
end
