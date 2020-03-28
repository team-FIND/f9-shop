class Gsearch::GsshopsController < ApplicationController
before_action :set_gshop, only: [:get_area, :show, :edit, :home_edit, :img_edit, :contact_edit, :access_edit, :time_edit, :info_edit, :update, :destroy, :contact, :access, :time, :info]
protect_from_forgery except: :create
before_action :set_current_user
before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $search = Gshop.search(params[:q])
    $gshops = $search.result
    render :layout => "search"
  end

  def show
    $gshop = Gshop.where(:id => params[:id]).first
    $gmenucs = $gshop.gmenucs.all
    $gsmenucs = $gshop.gsmenucs.all
    $gequipcs = $gshop.gequipcs.all
    $gstaffcs = $gshop.gstaffcs.all
    render :layout => "shop_home"
  end

  def contact
    render :layout => "shop_contents"
  end

  def access
    render :layout => "shop_contents"
  end

  def time
    render :layout => "shop_contents"
  end

  def info
    render :layout => "shop_contents"
  end

  private

    def set_gshop
      $gshop = Gshop.where(:id => params[:id]).first
    end
    
    def gshop_params
      params.require(:gshop).permit(:top_id, :area_id, :prefec_id, :user_id, gcategory_id, :category2, :category3, :category2, :category3, :gmenuc_id, :gsmenuc_id, :topimage, :remove_topimage, :remove_shopimage1, :remove_shopimage2, :remove_shopimage3, :topimage_cache, :shopimage1_cache, :shopimage2_cache, :shopimage3_cache, :shopimage1, :shopimage2, :shopimage3, :shopname, :username, :gcategory_id, :phone1, :email1, :postnumb, :address, :bus, :train, :sunam1, :sunam2, :sunam3, :sunam4, :sunpm1, :sunpm2, :sunpm3, :sunpm4, :monam1, :monam2, :monam3, :monam4, :monpm1, :monpm2, :monpm3, :monpm4, :tuepm1, :tuepm2, :tuepm3, :tueam4, :tuepm1, :tuepm2, :tuepm3, :tuepm4, :wedam1, :wedpm2, :wedpm3, :wedpm4, :thuam1, :thuam2, :thuam3, :thuam4, :thupm1, :thupm2, :thupm3, :thupm4, :friam1, :friam2, :friam3, :friam4, :fripm1, :fripm2, :fripm3, :fripm4, :satam1, :satam2, :satam3, :satam4, :satpm1, :satpm2, :satpm3, :satpm4, :ititle1, :info1, :ititle2, :info2, :ititle3, :info3)
    end
end