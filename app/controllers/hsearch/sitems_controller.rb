class Hsearch::SitemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $hmenu = Hmenu.where(:id => params[:hsmenu_id]).first
    $items = $hmenu.items.all
    render :layout => "menu_category"
  end

  def show
    $hmenu = Hmenu.where(:id => params[:hsmenu_id]).first
    $items = $hmenu.items.all
    render :layout => "shop/ashop/foods"
  end

  private

    def set_item
      $hmenu = Hmenu.where(:id => params[:hsmenu_id]).first
      $item = $hmenu.items.where(:id => params[:id]).first
    end

    def item_params
      params.require(:item).permit(:hmenu_id, :name, :topimg, :topimg_cache, :itemimg1, :itemimg1_cache, :itemimg2, :itemimg2_cache, :itemimg3, :itemimg3_cache, :itemname1, :itemname2, :price)
    end
end
