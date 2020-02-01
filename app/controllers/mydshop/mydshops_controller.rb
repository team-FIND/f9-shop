class Mydshop::MydshopsController < ApplicationController
before_action :set_dshop, only: [:get_area, :show, :edit, :home_edit, :img_edit, :contact_edit, :access_edit, :time_edit, :info_edit, :update, :destroy, :contact, :access, :time, :info]
protect_from_forgery except: :create
before_action :set_current_user
before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @user = User.where(:id => params[:user_id]).first
    $dshops = current_user.dshops.all
    render :layout => "app2"
  end

  def show
    $dshop = Dshop.where(:id => params[:id]).first
    render :layout => "shop/bshop/home"
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
    $dshop = Dshop.new
    render :layout => "shop/ashop/edit"
  end

  def home_new
    $dshop = Dshop.new
    render :layout => "shop/ashop/edit"
    $dshop.topimage.cache! unless $dshop.topimage.blank?
    $dshop.shopimage1.cache! unless $dshop.shopimage1.blank?
    $dshop.shopimage2.cache! unless $dshop.shopimage2.blank?    
    $dshop.shopimage3.cache! unless $dshop.shopimage3.blank?  
  end

  def edit
    $dshop.topimage.cache! unless $dshop.topimage.blank?
    $dshop.shopimage1.cache! unless $dshop.shopimage1.blank?
    $dshop.shopimage2.cache! unless $dshop.shopimage2.blank?    
    $dshop.shopimage3.cache! unless $dshop.shopimage3.blank?   
    render :layout => "shop/ashop/edit"
  end

  def home_edit
    $dshop.topimage.cache! unless $dshop.topimage.blank?
    $dshop.shopimage1.cache! unless $dshop.shopimage1.blank?
    $dshop.shopimage2.cache! unless $dshop.shopimage2.blank?    
    $dshop.shopimage3.cache! unless $dshop.shopimage3.blank?        
    render :layout => "shop/ashop/edit"
  end

  def img_edit
    $dshop.topimage.cache! unless $dshop.topimage.blank?
    $dshop.shopimage1.cache! unless $dshop.shopimage1.blank?
    $dshop.shopimage2.cache! unless $dshop.shopimage2.blank?    
    $dshop.shopimage3.cache! unless $dshop.shopimage3.blank?          
    render :layout => "shop/ashop/edit"
  end

  def contact_edit
    $dshop.topimage.cache! unless $dshop.topimage.blank?
    $dshop.shopimage1.cache! unless $dshop.shopimage1.blank?
    $dshop.shopimage2.cache! unless $dshop.shopimage2.blank?    
    $dshop.shopimage3.cache! unless $dshop.shopimage3.blank?            
    render :layout => "shop/ashop/edit"
  end

  def access_edit
    $dshop.topimage.cache! unless $dshop.topimage.blank?
    $dshop.shopimage1.cache! unless $dshop.shopimage1.blank?
    $dshop.shopimage2.cache! unless $dshop.shopimage2.blank?    
    $dshop.shopimage3.cache! unless $dshop.shopimage3.blank?               
    render :layout => "shop/ashop/edit"
  end

  def time_edit  
    $dshop.topimage.cache! unless $dshop.topimage.blank?
    $dshop.shopimage1.cache! unless $dshop.shopimage1.blank?
    $dshop.shopimage2.cache! unless $dshop.shopimage2.blank?    
    $dshop.shopimage3.cache! unless $dshop.shopimage3.blank?            
    render :layout => "shop/ashop/edit"
  end

  def info_edit  
    $dshop.topimage.cache! unless $dshop.topimage.blank?
    $dshop.shopimage1.cache! unless $dshop.shopimage1.blank?
    $dshop.shopimage2.cache! unless $dshop.shopimage2.blank?    
    $dshop.shopimage3.cache! unless $dshop.shopimage3.blank?              
    render :layout => "shop/ashop/edit"
  end

  def create
    $dshop = Dshop.new(dshop_params)
    $dshop.user_id = current_user.id

    respond_to do |format|
      if $dshop.save
        format.html { redirect_to mydshop_mydshops_path, notice: 'お店が追加されました！' }
        format.json { render :show, status: :created, location: $dshop }
      else
        format.html { redirect_to mydshop_mydshops_path }
        format.json { render json: $dshop.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $dshop.update(dshop_params)
        format.html { redirect_to mydshop_mydshops_path, notice: 'お店を更新できました！' }
        format.json { render :show, status: :ok, location: $dshop }
      else
        format.html { render :edit }
        format.json { render json: mydshop_mydshops_path, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $dshop.destroy
    respond_to do |format|
      format.html { redirect_to mydshop_mydshops_url, notice: '不要な削除は禁止されています' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_dshop
      $dshop = Dshop.where(:id => params[:id]).first
    end
    
    def dshop_params
      params.require(:dshop).permit(:top_id, :area_id, :prefec_id, :user_id, :dcategory_id, :category2, :category3, :bmenuc_id, :asmenuc_id, :topimage, :remove_topimage, :remove_shopimage1, :remove_shopimage2, :remove_shopimage3, :topimage_cache, :shopimage1_cache, :shopimage2_cache, :shopimage3_cache, :shopimage1, :shopimage2, :shopimage3, :shopname, :username, :phone1, :email1, :postnumb, :address, :bus, :train, :sunam1, :sunam2, :sunam3, :sunam4, :sunpm1, :sunpm2, :sunpm3, :sunpm4, :monam1, :monam2, :monam3, :monam4, :monpm1, :monpm2, :monpm3, :monpm4, :tuepm1, :tuepm2, :tuepm3, :tueam4, :tuepm1, :tuepm2, :tuepm3, :tuepm4, :wedam1, :wedpm2, :wedpm3, :wedpm4, :thuam1, :thuam2, :thuam3, :thuam4, :thupm1, :thupm2, :thupm3, :thupm4, :friam1, :friam2, :friam3, :friam4, :fripm1, :fripm2, :fripm3, :fripm4, :satam1, :satam2, :satam3, :satam4, :satpm1, :satpm2, :satpm3, :satpm4, :history, :career1, :career2, :career3, :career4, :career5, :recom1, :recom2, :recom3, :recom4, :recom5, :iititle1, :info1, :iititle2, :info2, :iititle3, :info3)
    end
end