class Myashop::MyatmenucsController < ApplicationController
  before_action :set_atmenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $ashop = Ashop.where(:id => params[:myashop_id]).first
    $asmenucs = $ashop.atmenucs.all
  end

  def show
    redirect_to myashop_myatmenuc_myatmenus_path(myatmenuc_id:$atmenuc)
  end

  def new
    $ashop = Ashop.where(:id => params[:myashop_id]).first
    $atmenuc = $ashop.atmenucs.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $ashop = Ashop.where(:id => params[:myashop_id]).first
    $atmenuc = $ashop.atmenucs.build(atmenuc_params)
    $atmenuc.user_id = current_user.id

    respond_to do |format|
      if $atmenuc.save
        format.html { redirect_to myashop_myashop_path(id:$ashop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $asmenuc }
      else
        format.html { render :new }
        format.json { render json: $atmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $atmenuc.update(atmenuc_params)
        format.html { redirect_to myashop_myashop_path(id:$ashop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $atmenuc }
      else
        format.html { render :edit }
        format.json { render json: $atmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def destroy
    $atmenuc.destroy
    respond_to do |format|
      format.html { redirect_to myashop_myashop_path(id:$ashop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_atmenuc
      $ashop = Ashop.where(:id => params[:myashop_id]).first
      $atmenuc = $ashop.atmenucs.where(:id => params[:id]).first
    end
    
    def atmenuc_params
      params.require(:atmenuc).permit(:ashop_id, :shopname, :user_id, :name)
    end
end
