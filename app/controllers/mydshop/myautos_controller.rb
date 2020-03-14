class Mydshop::MyautosController < ApplicationController
  before_action :set_auto, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $dmenu = Dmenu.where(:id => params[:mydmenu_id]).first
    $autos = $dmenu.autos.all
    render :layout => "menu_category"
  end

  def show
    $dmenu = Dmenu.where(:id => params[:mydmenu_id]).first
    $autos = $dmenu.autos.all
    render :layout => "shop/ashop/foods"
  end

  def new
    $dmenu = Dmenu.where(:id => params[:mydmenu_id]).first
    $auto = $dmenu.autos.build
    render :layout => "shop/ashop/edit"
  end

  def edit
    $auto.topimg.cache! unless $auto.topimg.blank?
    $auto.autoimg1.cache! unless $auto.autoimg1.blank?
    $auto.autoimg2.cache! unless $auto.autoimg2.blank?    
    $auto.autoimg3.cache! unless $auto.autoimg3.blank?   
    render :layout => "shop/ashop/edit"
  end

  def autoimg
    $auto.topimg.cache! unless $auto.topimg.blank?
    $auto.autoimg1.cache! unless $auto.autoimg1.blank?
    $auto.autoimg2.cache! unless $auto.autoimg2.blank?    
    $auto.autoimg3.cache! unless $auto.autoimg3.blank?   
    render :layout => "shop/ashop/edit"
  end

  def create
    $dmenu = Dmenu.where(:id => params[:mydmenu_id]).first
    $auto = $dmenu.autos.build(auto_params)
    $auto.user_id = current_user.id

    respond_to do |format|
      if $auto.save
        format.html { redirect_to mydshop_mydmenu_myauto_path(mydmenu_id:$dmenu, id:$auto), notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $auto }
      else
        format.html { render :new }
        format.json { render json: $auto.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $auto.update(auto_params)
        format.html { redirect_to mydshop_mydmenu_myauto_path(mydmenu_id:$dmenu, id:$auto), notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $auto }
      else
        format.html { render :edit }
        format.json { render json: $auto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    $auto.destroy
    respond_to do |format|
      format.html { redirect_to mydshop_mydmenu_myautos_path(mydmenu_id:$dmenu), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auto
      $dmenu = Dmenu.where(:id => params[:mydmenu_id]).first
      $auto = $dmenu.autos.where(:id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auto_params
      params.require(:auto).permit(:dmenu_id, :name, :topimg, :topimg_cache, :autoimg1, :autoimg1_cache, :autoimg2, :autoimg2_cache, :autoimg3, :autoimg3_cache, :autoname1, :autoname2, :price)
    end
end
