class Dshop::DshopsController < ApplicationController
before_action :set_dshop, only: [:get_area, :show, :edit, :home_edit, :img_edit, :contact_edit, :access_edit, :time_edit, :info_edit, :update, :destroy, :contact, :access, :time, :info]
protect_from_forgery except: :create
before_action :set_current_user
before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $prefec = Prefec.where(:name => params[:prefec_id]).first
    $dshops = $prefec.dshops.all
    render :layout => "app2"
  end

  def show
    $dshop = $prefec.dshops.where(:id => params[:id]).first
    render :layout => "shop_home"
  end

  def contact
    render :layout => "shop/ashop/contents"
  end

  def access
    render :layout => "shop/ashop/contents"
  end

  def time
    render :layout => "shop/ashop/contents"
  end

  def info
    render :layout => "shop/ashop/contents"
  end

  def pub
    render :layout => "shop/ashop/contents"
  end

  def create
  end

  def update
  end

  def destroy
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_dshop
      $prefec = Prefec.where(:name => params[:prefec_id]).first
      $dshop = $prefec.dshops.where(:id => params[:id]).first
    end
    
    def dshop_params
      params.require(:dshop).permit(:top_id, :area_id, :prefec_id, :user_id, :dcategory_id, :category2, :category3, :bmenuc_id, :asmenuc_id, :topimage, :remove_topimage, :remove_shopimage1, :remove_shopimage2, :remove_shopimage3, :topimage_cache, :shopimage1_cache, :shopimage2_cache, :shopimage3_cache, :shopimage1, :shopimage2, :shopimage3, :shopname, :username, :phone1, :email1, :postnumb, :address, :bus, :train, :sunam1, :sunam2, :sunam3, :sunam4, :sunpm1, :sunpm2, :sunpm3, :sunpm4, :monam1, :monam2, :monam3, :monam4, :monpm1, :monpm2, :monpm3, :monpm4, :tuepm1, :tuepm2, :tuepm3, :tueam4, :tuepm1, :tuepm2, :tuepm3, :tuepm4, :wedam1, :wedpm2, :wedpm3, :wedpm4, :thuam1, :thuam2, :thuam3, :thuam4, :thupm1, :thupm2, :thupm3, :thupm4, :friam1, :friam2, :friam3, :friam4, :fripm1, :fripm2, :fripm3, :fripm4, :satam1, :satam2, :satam3, :satam4, :satpm1, :satpm2, :satpm3, :satpm4, :ititle1, :info1, :ititle2, :info2, :ititle3, :info3)
    end
end