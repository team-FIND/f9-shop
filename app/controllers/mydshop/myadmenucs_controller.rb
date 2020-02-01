class Myashop::MyadmenucsController < ApplicationController
  before_action :set_admenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $ashop = Ashop.where(:id => params[:myashop_id]).first
    $admenucs = $ashop.admenucs.all
  end

  def show
    redirect_to myashop_myadmenuc_myadmenus_path(myadmenuc_id:$admenuc)
  end

  def new
    $ashop = Ashop.where(:id => params[:myashop_id]).first
    $admenuc = $ashop.admenucs.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $ashop = Ashop.where(:id => params[:myashop_id]).first
    $admenuc = $ashop.admenucs.build(admenuc_params)
    $admenuc.user_id = current_user.id

    respond_to do |format|
      if $admenuc.save
        format.html { redirect_to myashop_myashop_path(id:$ashop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $admenuc }
      else
        format.html { render :new }
        format.json { render json: $admenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $admenuc.update(admenuc_params)
        format.html { redirect_to myashop_myashop_path(id:$ashop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $admenuc }
      else
        format.html { render :edit }
        format.json { render json: $admenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def destroy
    $admenuc.destroy
    respond_to do |format|
      format.html { redirect_to myashop_myashop_path(id:$ashop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_admenuc
      $ashop = Ashop.where(:id => params[:myashop_id]).first
      $admenuc = $ashop.admenucs.where(:id => params[:id]).first
    end
    
    def admenuc_params
      params.require(:admenuc).permit(:ashop_id, :shopname, :user_id, :name)
    end
end
