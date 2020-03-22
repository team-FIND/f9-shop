class Myeshop::MyemenusController < ApplicationController
  before_action :set_emenu, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $emenuc = Emenuc.where(:id => params[:myemenuc_id]).first
    $emenus = $emenuc.emenus.all
    render :layout => "menu_category"
  end

  def show
    redirect_to myeshop_myemenu_myouts_path(myemenu_id:$emenu)
  end

  def new
    $emenuc = Emenuc.where(:id => params[:myemenuc_id]).first
    $emenu = $emenuc.emenus.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def menuline
    render :layout => "shop/ashop/menu_edit"
  end


  def create
    $emenuc = Emenuc.where(:id => params[:myemenuc_id]).first
    $emenu = $emenuc.emenus.build(emenu_params)
    $emenu.user_id = current_user.id

    respond_to do |format|
      if $emenu.save
        format.html { redirect_to myeshop_myemenuc_myemenus_path(myemenuc_id:$emenuc), notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $emenu }
      else
        format.html { render :new }
        format.json { render json: $emenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $emenu.update(emenu_params)
        format.html { redirect_to myeshop_myemenuc_myemenus_path(myemenuc_id:$emenuc), notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $emenu }
      else
        format.html { render :edit }
        format.json { render json: @emenu.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    $emenu.destroy
    respond_to do |format|
      format.html { redirect_to myeshop_myemenuc_myemenus_path(myemenuc_id:$emenuc), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_emenu
      $emenuc = Emenuc.where(:id => params[:myemenuc_id]).first
      $emenu = $emenuc.emenus.where(:id => params[:id]).first
    end


    def emenu_params
      params.require(:emenu).permit(:emenuc_id, :user_id, :name, :price, :time1, :time2, :time3, :time4, :menu1, :menu2, :menu3, :menu4, :menu5, :menu6, :menu7, :menu8, :menu9, :menu10, :menu11, :menu12, :menu13, :menu14, :menu15, :menu16, :menu17, :menu18, :menu19, :menu20)
    end
end
