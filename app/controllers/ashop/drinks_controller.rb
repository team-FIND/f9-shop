class Ashop::DrinksController < ApplicationController
before_action :set_drink, only: [:show, :edit, :update, :destroy]
protect_from_forgery except: :create

  def index
    $admenu = Admenu.where(:id => params[:admenu_id]).first
    $drinks = $admenu.drinks.all
    render :layout => "shop/ashop/contents"
  end

  def show
    $admenu = Admenu.where(:id => params[:admenu_id]).first
    $drinks = $admenu.drinks.all
    render :layout => "shop/ashop/foods"
  end

  def new
    $admenu = Admenu.where(:id => params[:admenu_id]).first
    $drink = $admenu.drinks.build
    render :layout => "shop/ashop/edit"
  end

  def edit
    $drink.drinkimg.cache! unless $drink.drinkimg.blank?   
    render :layout => "shop/ashop/edit"
  end

  def create
    $admenu = Admenu.where(:id => params[:admenu_id]).first
    $drink = $admenu.drinks.build(drink_params)

    respond_to do |format|
      if $drink.save
        format.html { redirect_to ashop_admenu_drinks_path, notice: 'Grand was successfully created.' }
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
        format.html { redirect_to ashop_admenu_drinks_path, notice: 'Menu was successfully updated.' }
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
      format.html { redirect_to ashop_admenu_drinks_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink
      $admenu = Admenu.where(:id => params[:admenu_id]).first
      $drink = $admenu.drinks.where(:id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drink_params
      params.require(:drink).permit(:admenu_id, :drinkname, :drinkprice, :drinkimg, :drinkimg_cache)
    end
end
