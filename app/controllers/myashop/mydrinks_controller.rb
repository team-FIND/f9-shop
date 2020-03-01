class Myashop::MydrinksController < ApplicationController
  before_action :set_drink, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $admenu = Admenu.where(:id => params[:myadmenu_id]).first
    $drinks = $admenu.drinks.all
    render :layout => "menu_category"
  end

  def show
    $admenu = Admenu.where(:id => params[:myadmenu_id]).first
    $drinks = $admenu.drinks.all
    render :layout => "shop/ashop/foods"
  end

  def new
    $admenu = Admenu.where(:id => params[:myadmenu_id]).first
    $drink = $admenu.drinks.build
    render :layout => "shop/ashop/edit"
  end

  def edit
    $drink.topimg.cache! unless $drink.topimg.blank?
    $drink.foodimg1.cache! unless $drink.foodimg1.blank?
    $drink.foodimg2.cache! unless $drink.foodimg2.blank?    
    $drink.foodimg3.cache! unless $drink.foodimg3.blank?   
    render :layout => "shop/ashop/edit"
  end

  def foodimg
    $drink.topimg.cache! unless $drink.topimg.blank?
    $drink.foodimg1.cache! unless $drink.foodimg1.blank?
    $drink.foodimg2.cache! unless $drink.foodimg2.blank?    
    $drink.foodimg3.cache! unless $drink.foodimg3.blank?   
    render :layout => "shop/ashop/edit"
  end

  def create
    $admenu = Admenu.where(:id => params[:myadmenu_id]).first
    $drink = $admenu.drinks.build(drink_params)
    $drink.user_id = current_user.id

    respond_to do |format|
      if $drink.save
        format.html { redirect_to myashop_myadmenu_mydrinks_path(myadmenu_id:$admenu), notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $drink }
      else
        format.html { render :new }
        format.json { render json: $drink.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $drink.update(drink_params)
        format.html { redirect_to myashop_myadmenu_mydrinks_path(myadmenu_id:$admenu), notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $drink }
      else
        format.html { render :edit }
        format.json { render json: $drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    $drink.destroy
    respond_to do |format|
      format.html { redirect_to myashop_myadmenu_mydrinks_path(myadmenu_id:$admenu), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink
      $admenu = Admenu.where(:id => params[:myadmenu_id]).first
      $drink = $admenu.drinks.where(:id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drink_params
      params.require(:drink).permit(:admenu_id, :name, :topimg, :topimg_cache, :foodimg1, :foodimg1_cache, :foodimg2, :foodimg2_cache, :foodimg3, :foodimg3_cache, :foodname1, :foodname2, :price)
    end
end
