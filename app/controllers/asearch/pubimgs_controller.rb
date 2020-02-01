class Asearch::PubimgsController < ApplicationController
  before_action :set_pubimg, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $ashop = Ashop.where(:id => params[:asshop_id]).first
    $pubimgs = $ashop.pubimgs.all
    render :layout => "shop/ashop/contents"
  end

  def show
    $ashop = Ashop.where(:id => params[:asshop_id]).first
    $pubimgs = $ashop.pubimgs.all
    render :layout => "shop/ashop/pubfoods"
  end

  def new
    $ashop = Ashop.where(:id => params[:asshop_id]).first
    $pubimg = $ashop.pubimgs.build
    render :layout => "shop/ashop/edit"
  end

  def edit
    $pubimg.foodimg1.cache! unless $pubimg.foodimg1.blank?
    $pubimg.foodimg2.cache! unless $pubimg.foodimg2.blank?    
    $pubimg.foodimg3.cache! unless $pubimg.foodimg3.blank?   
    render :layout => "shop/ashop/edit"
  end

  def foodimg
    $pubimg.foodimg1.cache! unless $pubimg.foodimg1.blank?
    $pubimg.foodimg2.cache! unless $pubimg.foodimg2.blank?    
    $pubimg.foodimg3.cache! unless $pubimg.foodimg3.blank?   
    render :layout => "shop/ashop/edit"
  end

  def create
    $ashop = Ashop.where(:id => params[:asshop_id]).first
    $pubimg = $ashop.pubimgs.build(pubimg_params)
    $pubimg.user_id = current_user.id

    respond_to do |format|
      if $pubimg.save
        format.html { redirect_to asearch_asshop_pubimg_path(asshop_id:$ashop, id:$pubimg), notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $ashop }
      else
        format.html { render :new }
        format.json { render json: $pubimg.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $pubimg.update(pubimg_params)
        format.html { redirect_to asearch_asshop_pubimg_path(asshop_id:$ashop, id:$pubimg), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $ashop }
      else
        format.html { render :edit }
        format.json { render json: $pubimg.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def set_pubimg
      $ashop = Ashop.where(:id => params[:asshop_id]).first
      $pubimg = $ashop.pubimgs.where(:id => params[:id]).first
    end

  private

    def pubimg_params
      params.require(:pubimg).permit(:user_id, :ashop_id, :topimg, :foodname1, :foodimg1_cache, :foodname2, :price, :foodimg1, :foodimg1_cache, :foodimg2, :foodimg2_cache, :foodimg3, :foodimg3_cache)
    end

end
