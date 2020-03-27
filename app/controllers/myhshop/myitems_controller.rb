class Myhshop::MyitemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $hmenu = Hmenu.where(:id => params[:myhmenu_id]).first
    $items = $hmenu.items.all
    render :layout => "menu_category"
  end

  def show
    $hmenu = Hmenu.where(:id => params[:myhmenu_id]).first
    $items = $hmenu.items.all
    render :layout => "shop/ashop/foods"
  end

  def new
    $hmenu = Hmenu.where(:id => params[:myhmenu_id]).first
    $item = $hmenu.items.build
    render :layout => "shop/ashop/edit"
  end

  def edit
    $item.topimg.cache! unless $item.topimg.blank?
    $item.itemimg1.cache! unless $item.itemimg1.blank?
    $item.itemimg2.cache! unless $item.itemimg2.blank?    
    $item.itemimg3.cache! unless $item.itemimg3.blank?   
    render :layout => "shop/ashop/edit"
  end

  def itemimg
    $item.topimg.cache! unless $item.topimg.blank?
    $item.itemimg1.cache! unless $item.itemimg1.blank?
    $item.itemimg2.cache! unless $item.itemimg2.blank?    
    $item.itemimg3.cache! unless $item.itemimg3.blank?   
    render :layout => "shop/ashop/edit"
  end

  def create
    $hmenu = Hmenu.where(:id => params[:myhmenu_id]).first
    $item = $hmenu.items.build(item_params)
    $item.user_id = current_user.id

    respond_to do |format|
      if $item.save
        format.html { redirect_to myhshop_myhmenu_myitem_path(myhmenu_id:$hmenu, id:$item), notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $item }
      else
        format.html { render :new }
        format.json { render json: $item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $item.update(item_params)
        format.html { redirect_to myhshop_myhmenu_myitem_path(myhmenu_id:$hmenu, id:$item), notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $item }
      else
        format.html { render :edit }
        format.json { render json: $item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    $item.destroy
    respond_to do |format|
      format.html { redirect_to myhshop_myhmenu_myitems_path(myhmenu_id:$hmenu), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      $hmenu = Hmenu.where(:id => params[:myhmenu_id]).first
      $item = $hmenu.items.where(:id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:hmenu_id, :name, :topimg, :topimg_cache, :itemimg1, :itemimg1_cache, :itemimg2, :itemimg2_cache, :itemimg3, :itemimg3_cache, :itemname1, :itemname2, :price)
    end
end
