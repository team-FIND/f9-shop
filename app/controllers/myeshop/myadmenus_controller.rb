class Myashop::MyadmenusController < ApplicationController
  before_action :set_admenu, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $admenuc = Admenuc.where(:id => params[:myadmenuc_id]).first
    $admenus = $admenuc.admenus.all
    render :layout => "shop/ashop/contents"
  end

  def show
    redirect_to myashop_myadmenu_mydrinks_path(myadmenu_id:$admenu)
  end

  def new
    $admenuc = Admenuc.where(:id => params[:myadmenuc_id]).first
    $admenu = $admenuc.admenus.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $admenuc = Admenuc.where(:id => params[:myadmenuc_id]).first
    $admenu = $admenuc.admenus.build(admenu_params)
    $admenu.user_id = current_user.id

    respond_to do |format|
      if $admenu.save
        format.html { redirect_to myashop_myadmenuc_myadmenus_path(myadmenuc_id:$admenuc), notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $admenu }
      else
        format.html { render :new }
        format.json { render json: $admenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $admenu.update(admenu_params)
        format.html { redirect_to myashop_myadmenuc_myadmenus_path(myadmenuc_id:$admenuc), notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $admenu }
      else
        format.html { render :edit }
        format.json { render json: @admenu.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    $admenu.destroy
    respond_to do |format|
      format.html { redirect_to myashop_myadmenuc_myadmenus_path(myadmenuc_id:$admenuc), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_admenu
      $admenuc = Admenuc.where(:id => params[:myadmenuc_id]).first
      $admenu = $admenuc.admenus.where(:id => params[:id]).first
    end


    def admenu_params
      params.require(:admenu).permit(:admenuc_id, :user_id, :name, :time1, :time2, :time3, :time4)
    end
end
