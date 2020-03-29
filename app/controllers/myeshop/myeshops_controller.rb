class Myeshop::MyeshopsController < ApplicationController
  before_action :set_eshop, only: [:get_area, :show, :edit, :home_edit, :img_edit, :contact_edit, :access_edit, :time_edit, :info_edit, :update, :destroy, :contact, :access, :time, :info]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @user = User.where(:id => params[:user_id]).first
    $eshops = current_user.eshops.all
    render :layout => "search"
  end

  def show
    $eshop = Eshop.where(:id => params[:id]).first
    $emenucs = $eshop.emenucs.all
    $esmenucs = $eshop.esmenucs.all
    $eequipcs = $eshop.eequipcs.all
    $estaffcs = $eshop.estaffcs.all
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

  def pub
    render :layout => "shop_contents"
  end

  def new
    $eshop = Eshop.new
    render :layout => "shop/ashop/edit"
  end

  def home_new
    $eshop = Eshop.new
    render :layout => "shop/ashop/edit"
    $eshop.topimage.cache! unless $eshop.topimage.blank?
    $eshop.shopimage1.cache! unless $eshop.shopimage1.blank?
    $eshop.shopimage2.cache! unless $eshop.shopimage2.blank?    
    $eshop.shopimage3.cache! unless $eshop.shopimage3.blank?  
  end

  def edit
    $eshop.topimage.cache! unless $eshop.topimage.blank?
    $eshop.shopimage1.cache! unless $eshop.shopimage1.blank?
    $eshop.shopimage2.cache! unless $eshop.shopimage2.blank?    
    $eshop.shopimage3.cache! unless $eshop.shopimage3.blank?   
    render :layout => "shop/ashop/edit"
  end

  def home_edit
    $eshop.topimage.cache! unless $eshop.topimage.blank?
    $eshop.shopimage1.cache! unless $eshop.shopimage1.blank?
    $eshop.shopimage2.cache! unless $eshop.shopimage2.blank?    
    $eshop.shopimage3.cache! unless $eshop.shopimage3.blank?        
    render :layout => "shop/ashop/edit"
  end

  def img_edit
    $eshop.topimage.cache! unless $eshop.topimage.blank?
    $eshop.shopimage1.cache! unless $eshop.shopimage1.blank?
    $eshop.shopimage2.cache! unless $eshop.shopimage2.blank?    
    $eshop.shopimage3.cache! unless $eshop.shopimage3.blank?          
    render :layout => "shop/ashop/edit"
  end

  def contact_edit
    $eshop.topimage.cache! unless $eshop.topimage.blank?
    $eshop.shopimage1.cache! unless $eshop.shopimage1.blank?
    $eshop.shopimage2.cache! unless $eshop.shopimage2.blank?    
    $eshop.shopimage3.cache! unless $eshop.shopimage3.blank?            
    render :layout => "shop/ashop/edit"
  end

  def access_edit
    $eshop.topimage.cache! unless $eshop.topimage.blank?
    $eshop.shopimage1.cache! unless $eshop.shopimage1.blank?
    $eshop.shopimage2.cache! unless $eshop.shopimage2.blank?    
    $eshop.shopimage3.cache! unless $eshop.shopimage3.blank?               
    render :layout => "shop/ashop/edit"
  end

  def time_edit  
    $eshop.topimage.cache! unless $eshop.topimage.blank?
    $eshop.shopimage1.cache! unless $eshop.shopimage1.blank?
    $eshop.shopimage2.cache! unless $eshop.shopimage2.blank?    
    $eshop.shopimage3.cache! unless $eshop.shopimage3.blank?            
    render :layout => "shop/ashop/edit"
  end

  def info_edit  
    $eshop.topimage.cache! unless $eshop.topimage.blank?
    $eshop.shopimage1.cache! unless $eshop.shopimage1.blank?
    $eshop.shopimage2.cache! unless $eshop.shopimage2.blank?    
    $eshop.shopimage3.cache! unless $eshop.shopimage3.blank?              
    render :layout => "shop/ashop/edit"
  end

  def create
    $eshop = Eshop.new(eshop_params)
    $eshop.user_id = current_user.id

    respond_to do |format|
      if $eshop.save
        format.html { redirect_to myeshop_myeshops_path, notice: 'お店が追加されました！' }
        format.json { render :show, status: :created, location: $eshop }
      else
        format.html { redirect_to myeshop_myeshops_path }
        format.json { render json: $eshop.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $eshop.update(eshop_params)
        format.html { redirect_to myeshop_myeshops_path, notice: 'お店を更新できました！' }
        format.json { render :show, status: :ok, location: $eshop }
      else
        format.html { render :edit }
        format.json { render json: myeshop_myeshops_path, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $eshop.destroy
    respond_to do |format|
      format.html { redirect_to myeshop_myeshops_url, notice: '不要な削除は禁止されています' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_eshop
      $eshop = Eshop.where(:id => params[:id]).first
    end
    
    def eshop_params
      params.require(:eshop).permit(:top_id, :area_id, :prefec_id, :user_id, :ecategory_id, :category2, :category3, :emenuc_id, :esmenuc_id, :topimage, :remove_topimage, :remove_shopimage1, :remove_shopimage2, :remove_shopimage3, :topimage_cache, :shopimage1_cache, :shopimage2_cache, :shopimage3_cache, :shopimage1, :shopimage2, :shopimage3, :shopname, :username, :phone1, :email1, :postnumb, :address, :bus, :train, :sunam1, :sunam2, :sunam3, :sunam4, :sunpm1, :sunpm2, :sunpm3, :sunpm4, :monam1, :monam2, :monam3, :monam4, :monpm1, :monpm2, :monpm3, :monpm4, :tuepm1, :tuepm2, :tuepm3, :tueam4, :tuepm1, :tuepm2, :tuepm3, :tuepm4, :wedam1, :wedpm2, :wedpm3, :wedpm4, :thuam1, :thuam2, :thuam3, :thuam4, :thupm1, :thupm2, :thupm3, :thupm4, :friam1, :friam2, :friam3, :friam4, :fripm1, :fripm2, :fripm3, :fripm4, :satam1, :satam2, :satam3, :satam4, :satpm1, :satpm2, :satpm3, :satpm4, :history, :career1, :career2, :career3, :career4, :career5, :recom1, :recom2, :recom3, :recom4, :recom5, :iititle1, :info1, :iititle2, :info2, :iititle3, :info3)
    end
end