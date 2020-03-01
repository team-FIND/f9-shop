class Myashop::MyatakeoutsController < ApplicationController
  before_action :set_atakeout, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $atmenu = Atmenu.where(:id => params[:myatmenu_id]).first
    $atakeouts = $atmenu.atakeouts.all
    render :layout => "menu_category"
  end

  def show
    $atmenu = Atmenu.where(:id => params[:myatmenu_id]).first
    $takeouts = $atmenu.atakeouts.all
    render :layout => "shop/ashop/foods"
  end

  def new
    $atmenu = Atmenu.where(:id => params[:myatmenu_id]).first
    $atakeout = $atmenu.atakeouts.build
    render :layout => "shop/ashop/edit"
  end

  def edit
    $atakeout.topimg.cache! unless $atakeout.topimg.blank?
    $atakeout.foodimg1.cache! unless $atakeout.foodimg1.blank?
    $atakeout.foodimg2.cache! unless $atakeout.foodimg2.blank?    
    $atakeout.foodimg3.cache! unless $atakeout.foodimg3.blank?      
    render :layout => "shop/ashop/edit"
  end

  def foodimg
    $atakeout.topimg.cache! unless $atakeout.topimg.blank?
    $atakeout.foodimg1.cache! unless $atakeout.foodimg1.blank?
    $atakeout.foodimg2.cache! unless $atakeout.foodimg2.blank?    
    $atakeout.foodimg3.cache! unless $atakeout.foodimg3.blank?   
    render :layout => "shop/ashop/foods_edit"
  end

  def create
    $atmenu = Atmenu.where(:id => params[:myatmenu_id]).first
    $atakeout = $atmenu.atakeouts.build(atakeout_params)
    $atakeout.user_id = current_user.id

    respond_to do |format|
      if $atakeout.save
        format.html { redirect_to myashop_myatmenu_myatakeouts_path(myatmenu_id:$atmenu), notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $food }
      else
        format.html { render :new }
        format.json { render json: $atakeout.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $atakeout.update(atakeout_params)
        format.html { redirect_to myashop_myatmenu_myatakeouts_path(myatmenu_id:$atmenu), notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $food }
      else
        format.html { render :edit }
        format.json { render json: $food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    $atakeout.destroy
    respond_to do |format|
      format.html { redirect_to myashop_myatmenu_myatakeouts_path(myatmenu_id:$atmenu), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atakeout
      $atmenu = Atmenu.where(:id => params[:myatmenu_id]).first
      $atakeout = $atmenu.atakeouts.where(:id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atakeout_params
      params.require(:atakeout).permit(:atmenu_id, :name, :topimg, :topimg_cache, :foodimg1, :foodimg1_cache, :foodimg2, :foodimg2_cache, :foodimg3, :foodimg3_cache, :foodname1, :foodname2, :price)
    end
end
