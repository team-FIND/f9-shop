class Myashop::MyasmenucsController < ApplicationController
  before_action :set_asmenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $ashop = Ashop.where(:id => params[:myashop_id]).first
    $asmenucs = $ashop.asmenucs.all
  end

  def show
    redirect_to myashop_myasmenuc_myasmenus_path(myasmenuc_id:$asmenuc)
  end

  def new
    $ashop = Ashop.where(:id => params[:myashop_id]).first
    $asmenuc = $ashop.asmenucs.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $ashop = Ashop.where(:id => params[:myashop_id]).first
    $asmenuc = $ashop.asmenucs.build(asmenuc_params)
    $asmenuc.user_id = current_user.id

    respond_to do |format|
      if $asmenuc.save
        format.html { redirect_to myashop_myashop_path(id:$ashop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $asmenuc }
      else
        format.html { render :new }
        format.json { render json: $asmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $asmenuc.update(asmenuc_params)
        format.html { redirect_to myashop_myashop_path(id:$ashop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $asmenuc }
      else
        format.html { render :edit }
        format.json { render json: $asmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def destroy
    $asmenuc.destroy
    respond_to do |format|
      format.html { redirect_to myashop_myashop_path(id:$ashop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_asmenuc
      $ashop = Ashop.where(:id => params[:myashop_id]).first
      $asmenuc = $ashop.asmenucs.where(:id => params[:id]).first
    end
    
    def asmenuc_params
      params.require(:asmenuc).permit(:ashop_id, :shopname, :user_id, :name)
    end
end
