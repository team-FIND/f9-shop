class Myashop::MyatmenusController < ApplicationController
  before_action :set_atmenu, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $atmenuc = Atmenuc.where(:id => params[:myatmenuc_id]).first
    $atmenus = $atmenuc.atmenus.all
    render :layout => "shop/ashop/contents"
  end

  def show
    redirect_to myashop_myatmenu_myatakeouts_path(myatmenu_id:$atmenu)
  end

  def new
    $atmenuc = Atmenuc.where(:id => params[:myatmenuc_id]).first
    $atmenu = $atmenuc.atmenus.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $atmenuc = Atmenuc.where(:id => params[:myatmenuc_id]).first
    $atmenu = $atmenuc.atmenus.build(atmenu_params)
    $atmenu.user_id = current_user.id

    respond_to do |format|
      if $atmenu.save
        format.html { redirect_to myashop_myatmenuc_myatmenus_path(myatmenuc_id:$atmenuc), notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $atmenu }
      else
        format.html { render :new }
        format.json { render json: $atmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $atmenu.update(atmenu_params)
        format.html { redirect_to myashop_myatmenuc_myatmenus_path(myatmenuc_id:$atmenuc), notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $admenu }
      else
        format.html { render :edit }
        format.json { render json: @atmenu.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    $atmenu.destroy
    respond_to do |format|
      format.html { redirect_to myashop_myatmenuc_myatmenus_path(myatmenuc_id:$atmenuc), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_atmenu
      $atmenuc = Atmenuc.where(:id => params[:myatmenuc_id]).first
      $atmenu = $atmenuc.atmenus.where(:id => params[:id]).first
    end


    def atmenu_params
      params.require(:atmenu).permit(:atmenuc_id, :user_id, :name, :time1, :time2, :time3, :time4)
    end
end
