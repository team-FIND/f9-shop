class Ashop::DrinksController < ApplicationController
before_action :set_drink, only: [:show, :edit, :update, :destroy]
protect_from_forgery except: :create

  def index
    $admenu = Admenu.where(:id => params[:admenu_id]).first
    $drinks = $admenu.drinks.all
    render :layout => "menu_category"
  end

  def show
    $admenu = Admenu.where(:id => params[:admenu_id]).first
    $drinks = $admenu.drinks.all
    render :layout => "foods"
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
