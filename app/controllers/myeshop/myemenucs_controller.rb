class Myeshop::MyemenucsController < ApplicationController
  before_action :set_emenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $eshop = Eshop.where(:id => params[:myeshop_id]).first
    $emenucs = $eshop.emenucs.all
  end

  def show
    redirect_to myeshop_myemenuc_myemenus_path(myemenuc_id:$emenuc)
  end

  def new
    $eshop = Eshop.where(:id => params[:myeshop_id]).first
    $emenuc = $eshop.emenucs.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $eshop = Eshop.where(:id => params[:myeshop_id]).first
    $emenuc = $eshop.emenucs.build(emenuc_params)
    $emenuc.user_id = current_user.id

    respond_to do |format|
      if $emenuc.save
        format.html { redirect_to myeshop_myeshop_path(id:$eshop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $emenuc }
      else
        format.html { render :new }
        format.json { render json: $emenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $emenuc.update(emenuc_params)
        format.html { redirect_to myeshop_myeshop_path(id:$eshop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $emenuc }
      else
        format.html { render :edit }
        format.json { render json: $emenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $emenuc.destroy
    respond_to do |format|
      format.html { redirect_to myeshop_myeshop_path(id:$eshop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_emenuc
      $eshop = Eshop.where(:id => params[:myeshop_id]).first
      $emenuc = $eshop.emenucs.where(:id => params[:id]).first
    end
    
    def emenuc_params
      params.require(:emenuc).permit(:eshop_id, :shopname, :user_id, :name)
    end
end
