class Myhshop::MyhmenusController < ApplicationController
  before_action :set_hmenu, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $hmenuc = Hmenuc.where(:id => params[:myhmenuc_id]).first
    $hmenus = $hmenuc.hmenus.all
    render :layout => "menu_category"
  end

  def show
    redirect_to myhshop_myhmenu_myitems_path(myhmenu_id:$hmenu)
  end

  def new
    $hmenuc = Hmenuc.where(:id => params[:myhmenuc_id]).first
    $hmenu = $hmenuc.hmenus.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def menuline
    render :layout => "shop/ashop/menu_edit"
  end


  def create
    $hmenuc = Hmenuc.where(:id => params[:myhmenuc_id]).first
    $hmenu = $hmenuc.hmenus.build(hmenu_params)
    $hmenu.user_id = current_user.id

    respond_to do |format|
      if $hmenu.save
        format.html { redirect_to myhshop_myhmenuc_myhmenus_path(myhmenuc_id:$hmenuc), notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $hmenu }
      else
        format.html { render :new }
        format.json { render json: $hmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $hmenu.update(hmenu_params)
        format.html { redirect_to myhshop_myhmenuc_myhmenus_path(myhmenuc_id:$hmenuc), notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $hmenu }
      else
        format.html { render :edit }
        format.json { render json: @hmenu.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    $hmenu.destroy
    respond_to do |format|
      format.html { redirect_to myhshop_myhmenuc_myhmenus_path(myhmenuc_id:$hmenuc), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_hmenu
      $hmenuc = Hmenuc.where(:id => params[:myhmenuc_id]).first
      $hmenu = $hmenuc.hmenus.where(:id => params[:id]).first
    end


    def hmenu_params
      params.require(:hmenu).permit(:hmenuc_id, :user_id, :name, :price, :time1, :time2, :time3, :time4, :menu1, :menu2, :menu3, :menu4, :menu5, :menu6, :menu7, :menu8, :menu9, :menu10, :menu11, :menu12, :menu13, :menu14, :menu15, :menu16, :menu17, :menu18, :menu19, :menu20)
    end
end
