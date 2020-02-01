class Asearch::PubmenusController < ApplicationController
  before_action :set_pubmenu, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $ashop = Ashop.where(:id => params[:asshop_id]).first
    $pubmenus = $ashop.pubmenus.all
    render :layout => "shop/ashop/contents"
  end

  def show
    $ashop = Ashop.where(:id => params[:asshop_id]).first
    $pubmenus = $ashop.pubmenus.all
    render :layout => "shop/ashop/pubfoods"
  end

  def new
    $ashop = Ashop.where(:id => params[:asshop_id]).first
    $pubmenu = $ashop.pubmenus.build
    render :layout => "shop/ashop/edit"
  end

  def edit
    $pubmenu.img1.cache! unless $pubmenu.img1.blank?
    $pubmenu.img2.cache! unless $pubmenu.img2.blank?    
    $pubmenu.img3.cache! unless $pubmenu.img3.blank?   
    render :layout => "shop/ashop/edit"
  end

  def foodimg
    $pubmenu.img1.cache! unless $pubmenu.img1.blank?
    $pubmenu.img2.cache! unless $pubmenu.img2.blank?    
    $pubmenu.img3.cache! unless $pubmenu.img3.blank?     
    render :layout => "shop/ashop/edit"
  end

  def create
    $ashop = Ashop.where(:id => params[:asshop_id]).first
    $pubmenu = $ashop.pubmenus.build(pubmenu_params)
    $pubmenu.user_id = current_user.id

    respond_to do |format|
      if $pubmenu.save
        format.html { redirect_to asearch_asshop_pubmenu_path(asshop_id:$ashop, id:$pubmenu), notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $ashop }
      else
        format.html { render :new }
        format.json { render json: $pubmenu.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $pubmenu.update(pubmenu_params)
        format.html { redirect_to asearch_asshop_pubmenu_path(asshop_id:$ashop, id:$pubmenu), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $ashop }
      else
        format.html { render :edit }
        format.json { render json: $pubmenu.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def set_pubmenu
      $ashop = Ashop.where(:id => params[:asshop_id]).first
      $pubmenu = $ashop.pubmenus.where(:id => params[:id]).first
  end

  private

    def pubmenu_params
      params.require(:pubmenu).permit(:ashop_id, :user_id, :name, :img1, :img1_cache, :img2, :img2_cache, :img3, :img3_cache)
    end

end
