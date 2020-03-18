class Myeshop::MyoutsController < ApplicationController
  before_action :set_out, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $emenu = Emenu.where(:id => params[:myemenu_id]).first
    $outs = $emenu.outs.all
    render :layout => "menu_category"
  end

  def show
    $emenu = Emenu.where(:id => params[:myemenu_id]).first
    $outs = $emenu.outs.all
    render :layout => "shop/ashop/foods"
  end

  def new
    $emenu = Emenu.where(:id => params[:myemenu_id]).first
    $out = $emenu.outs.build
    render :layout => "shop/ashop/edit"
  end

  def edit
    $out.topimg.cache! unless $out.topimg.blank?
    $out.outimg1.cache! unless $out.outimg1.blank?
    $out.outimg2.cache! unless $out.outimg2.blank?    
    $out.outimg3.cache! unless $out.outimg3.blank?   
    render :layout => "shop/ashop/edit"
  end

  def outimg
    $out.topimg.cache! unless $out.topimg.blank?
    $out.outimg1.cache! unless $out.outimg1.blank?
    $out.outimg2.cache! unless $out.outimg2.blank?    
    $out.outimg3.cache! unless $out.outimg3.blank?   
    render :layout => "shop/ashop/edit"
  end

  def create
    $emenu = Emenu.where(:id => params[:myemenu_id]).first
    $out = $emenu.outs.build(out_params)
    $out.user_id = current_user.id

    respond_to do |format|
      if $out.save
        format.html { redirect_to myeshop_myemenu_myout_path(myemenu_id:$emenu, id:$out), notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $out }
      else
        format.html { render :new }
        format.json { render json: $out.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $out.update(out_params)
        format.html { redirect_to myeshop_myemenu_myout_path(myemenu_id:$emenu, id:$out), notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $out }
      else
        format.html { render :edit }
        format.json { render json: $out.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $out.destroy
    respond_to do |format|
      format.html { redirect_to myeshop_myemenu_myouts_path(myemenu_id:$emenu), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_out
      $emenu = Emenu.where(:id => params[:myemenu_id]).first
      $out = $emenu.outs.where(:id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def out_params
      params.require(:out).permit(:emenu_id, :name, :topimg, :topimg_cache, :outimg1, :outimg1_cache, :outimg2, :outimg2_cache, :outimg3, :outimg3_cache, :outname1, :outname2, :price)
    end
end
