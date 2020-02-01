class Myashop::MyamenusController < ApplicationController
  before_action :set_amenu, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $amenuc = Amenuc.where(:id => params[:myamenuc_id]).first
    $amenus = $amenuc.amenus.all
    render :layout => "shop/ashop/contents"
  end

  def show
    redirect_to myashop_myamenu_myfoods_path(myamenu_id:$amenu)
  end

  def new
    $amenuc = Amenuc.where(:id => params[:myamenuc_id]).first
    $amenu = $amenuc.amenus.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def menuline
    render :layout => "shop/ashop/menu_edit"
  end


  def create
    $amenuc = Amenuc.where(:id => params[:myamenuc_id]).first
    $amenu = $amenuc.amenus.build(amenu_params)
    $amenu.user_id = current_user.id

    respond_to do |format|
      if $amenu.save
        format.html { redirect_to myashop_myamenuc_myamenus_path(myamenuc_id:$amenuc), notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $amenu }
      else
        format.html { render :new }
        format.json { render json: $amenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $amenu.update(amenu_params)
        format.html { redirect_to myashop_myamenuc_myamenus_path(myamenuc_id:$amenuc), notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $amenu }
      else
        format.html { render :edit }
        format.json { render json: @amenu.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    $amenu.destroy
    respond_to do |format|
      format.html { redirect_to myashop_myamenuc_myamenus_path(myamenuc_id:$amenuc), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_amenu
      $amenuc = Amenuc.where(:id => params[:myamenuc_id]).first
      $amenu = $amenuc.amenus.where(:id => params[:id]).first
    end


    def amenu_params
      params.require(:amenu).permit(:amenuc_id, :user_id, :name, :price, :time1, :time2, :time3, :time4, :menu1, :menu2, :menu3, :menu4, :menu5, :menu6, :menu7, :menu8, :menu9, :menu10, :menu11, :menu12, :menu13, :menu14, :menu15, :menu16, :menu17, :menu18, :menu19, :menu20)
    end
end
