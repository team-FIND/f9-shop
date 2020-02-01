class Myashop::MyamenucsController < ApplicationController
  before_action :set_amenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $ashop = Ashop.where(:id => params[:myashop_id]).first
    $amenucs = $ashop.amenucs.all
  end

  def show
    redirect_to myashop_myamenuc_myamenus_path(myamenuc_id:$amenuc)
  end

  def new
    $ashop = Ashop.where(:id => params[:myashop_id]).first
    $amenuc = $ashop.amenucs.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $ashop = Ashop.where(:id => params[:myashop_id]).first
    $amenuc = $ashop.amenucs.build(amenuc_params)
    $amenuc.user_id = current_user.id

    respond_to do |format|
      if $amenuc.save
        format.html { redirect_to myashop_myashop_path(id:$ashop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $amenuc }
      else
        format.html { render :new }
        format.json { render json: $amenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $amenuc.update(amenuc_params)
        format.html { redirect_to myashop_myashop_path(id:$ashop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $amenuc }
      else
        format.html { render :edit }
        format.json { render json: $amenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def destroy
    $amenuc.destroy
    respond_to do |format|
      format.html { redirect_to myashop_myashop_path(id:$ashop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_amenuc
      $ashop = Ashop.where(:id => params[:myashop_id]).first
      $amenuc = $ashop.amenucs.where(:id => params[:id]).first
    end
    
    def amenuc_params
      params.require(:amenuc).permit(:ashop_id, :shopname, :user_id, :name)
    end
end
