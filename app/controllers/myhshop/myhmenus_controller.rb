class Mydshop::MydmenusController < ApplicationController
  before_action :set_dmenu, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $dmenuc = Dmenuc.where(:id => params[:mydmenuc_id]).first
    $dmenus = $dmenuc.dmenus.all
    render :layout => "menu_category"
  end

  def show
    redirect_to mydshop_mydmenu_myautos_path(mydmenu_id:$dmenu)
  end

  def new
    $dmenuc = Dmenuc.where(:id => params[:mydmenuc_id]).first
    $dmenu = $dmenuc.dmenus.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def menuline
    render :layout => "shop/ashop/menu_edit"
  end


  def create
    $dmenuc = Dmenuc.where(:id => params[:mydmenuc_id]).first
    $dmenu = $dmenuc.dmenus.build(dmenu_params)
    $dmenu.user_id = current_user.id

    respond_to do |format|
      if $dmenu.save
        format.html { redirect_to mydshop_mydmenuc_mydmenus_path(mydmenuc_id:$dmenuc), notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $dmenu }
      else
        format.html { render :new }
        format.json { render json: $dmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $dmenu.update(dmenu_params)
        format.html { redirect_to mydshop_mydmenuc_mydmenus_path(mydmenuc_id:$dmenuc), notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $dmenu }
      else
        format.html { render :edit }
        format.json { render json: @dmenu.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    $dmenu.destroy
    respond_to do |format|
      format.html { redirect_to mydshop_mydmenuc_mydmenus_path(mydmenuc_id:$dmenuc), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_dmenu
      $dmenuc = Dmenuc.where(:id => params[:mydmenuc_id]).first
      $dmenu = $dmenuc.dmenus.where(:id => params[:id]).first
    end


    def dmenu_params
      params.require(:dmenu).permit(:dmenuc_id, :user_id, :name, :price, :time1, :time2, :time3, :time4, :menu1, :menu2, :menu3, :menu4, :menu5, :menu6, :menu7, :menu8, :menu9, :menu10, :menu11, :menu12, :menu13, :menu14, :menu15, :menu16, :menu17, :menu18, :menu19, :menu20)
    end
end
