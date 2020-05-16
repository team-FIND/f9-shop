class Myashop::MyfoodsController < ApplicationController
  before_action :set_food, only: [:get_amenu, :show, :edit, :update, :destroy, :foodimg]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $amenu = Amenu.where(:id => params[:myamenu_id]).first
    $foods = $amenu.foods.all
    render :layout => "menu_category"
  end

  def show
    $amenu = Amenu.where(:id => params[:myamenu_id]).first
    $foods = $amenu.foods.all
    render :layout => "foods"
  end

  def new
    $amenu = Amenu.where(:id => params[:myamenu_id]).first
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

  def foodimg1
    render :layout => "foods"
    $food.topimg.cache! unless $food.topimg.blank?
    $food.foodimg2.cache! unless $food.foodimg2.blank?    
    $food.foodimg3.cache! unless $food.foodimg3.blank?  
  end

  def foodimg2
    render :layout => "foods"
    $food.topimg.cache! unless $food.topimg.blank?
    $food.foodimg1.cache! unless $food.foodimg2.blank?    
    $food.foodimg3.cache! unless $food.foodimg3.blank?  
  end

  def foodimg3
    render :layout => "foods"$food.topimg.cache! unless $food.topimg.blank?
    $food.foodimg1.cache! unless $food.foodimg2.blank?    
    $food.foodimg2.cache! unless $food.foodimg3.blank?  

  end

  def create
    $amenu = Amenu.where(:id => params[:myamenu_id]).first
    $food = $amenu.foods.build(food_params)
    $food.user_id = current_user.id

    respond_to do |format|
      if $food.save
        format.html { redirect_to myashop_myamenu_myfood_path(myamenu_id:$amenu, id:$food), notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $food }
      else
        format.html { render :new }
        format.json { render json: $food.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $food.update(food_params)
        format.html { redirect_to myashop_myamenu_myfood_path(myamenu_id:$amenu, id:$food), notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $food }
      else
        format.html { render :edit }
        format.json { render json: $food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $food.destroy
    respond_to do |format|
      format.html { redirect_to myashop_myamenu_myfoods_path(myamenu_id:$amenu), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private
    def set_food
      $amenu = Amenu.where(:id => params[:myamenu_id]).first
      $food = $amenu.foods.where(:id => params[:id]).first
    end

    def food_params
      params.require(:food).permit(:amenu_id, :name, :topimg, :topimg_cache, :foodimg1, :foodimg1_cache, :foodimg2, :foodimg2_cache, :foodimg3, :foodimg3_cache, :foodname1, :foodname2, :price)
    end
end
