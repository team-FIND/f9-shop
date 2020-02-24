class Mybshop::MybshopsController < ApplicationController
before_action :set_bshop, only: [:get_area, :show, :edit, :home_edit, :img_edit, :contact_edit, :access_edit, :time_edit, :info_edit, :update, :destroy, :contact, :access, :time, :info]
protect_from_forgery except: :create
before_action :set_current_user
before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @user = User.where(:id => params[:user_id]).first
    $bshops = current_user.bshops.all
    render :layout => "search"
  end

  def show
    $bshop = Bshop.where(:id => params[:id]).first
    $bmenucs = $bshop.bmenucs.all
    $bsmenucs = $bshop.bsmenucs.all
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

  def new
    $bshop = Bshop.new
    render :layout => "shop/ashop/edit"
  end

  def home_new
    $bshop = Bshop.new
    render :layout => "shop/ashop/edit"
    $bshop.topimage.cache! unless $bshop.topimage.blank?
    $bshop.shopimage1.cache! unless $bshop.shopimage1.blank?
    $bshop.shopimage2.cache! unless $bshop.shopimage2.blank?    
    $bshop.shopimage3.cache! unless $bshop.shopimage3.blank?  
  end

  def edit
    $bshop.topimage.cache! unless $bshop.topimage.blank?
    $bshop.shopimage1.cache! unless $bshop.shopimage1.blank?
    $bshop.shopimage2.cache! unless $bshop.shopimage2.blank?    
    $bshop.shopimage3.cache! unless $bshop.shopimage3.blank?  
    render :layout => "shop/ashop/edit"
  end

  def home_edit
    $bshop.topimage.cache! unless $bshop.topimage.blank?
    $bshop.shopimage1.cache! unless $bshop.shopimage1.blank?
    $bshop.shopimage2.cache! unless $bshop.shopimage2.blank?    
    $bshop.shopimage3.cache! unless $bshop.shopimage3.blank?      
    render :layout => "shop/ashop/edit"
  end

  def img_edit
    $bshop.topimage.cache! unless $bshop.topimage.blank?
    $bshop.shopimage1.cache! unless $bshop.shopimage1.blank?
    $bshop.shopimage2.cache! unless $bshop.shopimage2.blank?    
    $bshop.shopimage3.cache! unless $bshop.shopimage3.blank?         
    render :layout => "shop/ashop/edit"
  end

  def contact_edit
    $bshop.topimage.cache! unless $bshop.topimage.blank?
    $bshop.shopimage1.cache! unless $bshop.shopimage1.blank?
    $bshop.shopimage2.cache! unless $bshop.shopimage2.blank?    
    $bshop.shopimage3.cache! unless $bshop.shopimage3.blank?          
    render :layout => "shop/ashop/edit"
  end

  def access_edit
    $bshop.topimage.cache! unless $bshop.topimage.blank?
    $bshop.shopimage1.cache! unless $bshop.shopimage1.blank?
    $bshop.shopimage2.cache! unless $bshop.shopimage2.blank?    
    $bshop.shopimage3.cache! unless $bshop.shopimage3.blank?             
    render :layout => "shop/ashop/edit"
  end

  def time_edit  
    $bshop.topimage.cache! unless $bshop.topimage.blank?
    $bshop.shopimage1.cache! unless $bshop.shopimage1.blank?
    $bshop.shopimage2.cache! unless $bshop.shopimage2.blank?    
    $bshop.shopimage3.cache! unless $bshop.shopimage3.blank?           
    render :layout => "shop/ashop/edit"
  end

  def info_edit  
    $bshop.topimage.cache! unless $bshop.topimage.blank?
    $bshop.shopimage1.cache! unless $bshop.shopimage1.blank?
    $bshop.shopimage2.cache! unless $bshop.shopimage2.blank?    
    $bshop.shopimage3.cache! unless $bshop.shopimage3.blank?            
    render :layout => "shop/ashop/edit"
  end

  def create
    $bshop = Bshop.new(bshop_params)
    $bshop.user_id = current_user.id

    respond_to do |format|
      if $bshop.save
        format.html { redirect_to mybshop_mybshops_path, notice: 'お店が追加されました！' }
        format.json { render :show, status: :created, location: $bshop }
      else
        format.html { redirect_to mybshop_mybshops_path }
        format.json { render json: $bshop.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $bshop.update(bshop_params)
        format.html { redirect_to mybshop_mybshops_path, notice: 'お店を更新できました！' }
        format.json { render :show, status: :ok, location: $bshop }
      else
        format.html { render :edit }
        format.json { render json: mybshop_mybshops_path, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $bshop.destroy
    respond_to do |format|
      format.html { redirect_to mybshop_mybshops_url, notice: '不要な削除は禁止されています' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_bshop
      $bshop = Bshop.where(:id => params[:id]).first
    end
    
    def bshop_params
      params.require(:bshop).permit(:top_id, :area_id, :prefec_id, :user_id, :bcategory_id, :category2, :category3, :bmenuc_id, :asmenuc_id, :topimage, :remove_topimage, :remove_shopimage1, :remove_shopimage2, :remove_shopimage3, :topimage_cache, :shopimage1_cache, :shopimage2_cache, :shopimage3_cache, :shopimage1, :shopimage2, :shopimage3, :shopname, :username, :phone1, :email1, :postnumb, :address, :bus, :train, :sunam1, :sunam2, :sunam3, :sunam4, :sunpm1, :sunpm2, :sunpm3, :sunpm4, :monam1, :monam2, :monam3, :monam4, :monpm1, :monpm2, :monpm3, :monpm4, :tuepm1, :tuepm2, :tuepm3, :tueam4, :tuepm1, :tuepm2, :tuepm3, :tuepm4, :wedam1, :wedpm2, :wedpm3, :wedpm4, :thuam1, :thuam2, :thuam3, :thuam4, :thupm1, :thupm2, :thupm3, :thupm4, :friam1, :friam2, :friam3, :friam4, :fripm1, :fripm2, :fripm3, :fripm4, :satam1, :satam2, :satam3, :satam4, :satpm1, :satpm2, :satpm3, :satpm4, :history, :career1, :career2, :career3, :career4, :career5, :recom1, :recom2, :recom3, :recom4, :recom5, :iititle1, :info1, :iititle2, :info2, :iititle3, :info3)
    end
end