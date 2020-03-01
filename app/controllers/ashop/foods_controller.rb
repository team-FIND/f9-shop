class Ashop::FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $amenu = Amenu.where(:id => params[:amenu_id]).first
    $foods = $amenu.foods.all
    render :layout => "menu_category"
  end

  def show
    $amenu = Amenu.where(:id => params[:amenu_id]).first
    $foods = $amenu.foods.all
    render :layout => "shop/ashop/foods"
  end

  def new
    $amenu = Amenu.where(:id => params[:amenu_id]).first
    $food = $amenu.foods.build
    render :layout => "shop/ashop/edit"
  end

  def edit
    $food.topimg.cache! unless $food.topimg.blank?
    $food.foodimg1.cache! unless $food.foodimg1.blank?
    $food.foodimg2.cache! unless $food.foodimg2.blank?    
    $food.foodimg3.cache! unless $food.foodimg3.blank?   
    render :layout => "shop/ashop/edit"
  end

  def foodimg
    $food.topimg.cache! unless $food.topimg.blank?
    $food.foodimg1.cache! unless $food.foodimg1.blank?
    $food.foodimg2.cache! unless $food.foodimg2.blank?    
    $food.foodimg3.cache! unless $food.foodimg3.blank?   
    render :layout => "shop/ashop/edit"
  end

  def create
    $amenu = Amenu.where(:id => params[:amenu_id]).first
    $food = $amenu.foods.build(food_params)

    respond_to do |format|
      if $food.save
        format.html { redirect_to ashop_amenu_foods_path, notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $food }
      else
        format.html { render :new }
        format.json { render json: $food.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      $amenu = Amenu.where(:id => params[:amenu_id]).first
      $food = $amenu.foods.where(:id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:amenu_id, :name, :topimg, :topimg_cache, :foodimg1, :foodimg1_cache, :foodimg2, :foodimg2_cache, :foodimg3, :foodimg3_cache, :foodname1, :foodname2, :price)
    end
end
