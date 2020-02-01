class Myashop::MyasmenusController < ApplicationController
  before_action :set_asmenu, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $asmenuc = Asmenuc.where(:id => params[:myasmenuc_id]).first
    $asmenus = $asmenuc.asmenus.all
    render :layout => "shop/ashop/contents"
  end

  def show
  end

  def new
    $asmenuc = Asmenuc.where(:id => params[:myasmenuc_id]).first
    $asmenu = $asmenuc.asmenus.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $asmenuc = Asmenuc.where(:id => params[:myasmenuc_id]).first
    $asmenu = $asmenuc.asmenus.build(asmenu_params)
    $asmenu.user_id = current_user.id

    respond_to do |format|
      if $asmenu.save
        format.html { redirect_to myashop_myasmenuc_myasmenus_path(myasmenuc_id:$asmenuc), notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $asmenu }
      else
        format.html { render :new }
        format.json { render json: $asmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $asmenu.update(asmenu_params)
        format.html { redirect_to myashop_myasmenuc_myasmenus_path(myasmenuc_id:$asmenuc), notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $asmenu }
      else
        format.html { render :edit }
        format.json { render json: @asmenu.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    $asmenu.destroy
    respond_to do |format|
      format.html { redirect_to myashop_myasmenuc_myasmenus_path(myasmenuc_id:$asmenuc), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_asmenu
      $asmenuc = Admenuc.where(:id => params[:myasmenuc_id]).first
      $asmenu = $asmenuc.asmenus.where(:id => params[:id]).first
    end


    def asmenu_params
      params.require(:asmenu).permit(:asmenuc_id, :user_id, :name, :time1, :time2, :time3, :time4)
    end
end
