class Mydshop::MydmenucsController < ApplicationController
  before_action :set_dmenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $dshop = Dshop.where(:id => params[:mydshop_id]).first
    $dmenucs = $dshop.dmenucs.all
  end

  def show
    redirect_to mydshop_mydmenuc_mydmenus_path(mydmenuc_id:$dmenuc)
  end

  def new
    $dshop = Dshop.where(:id => params[:mydshop_id]).first
    $dmenuc = $dshop.dmenucs.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $dshop = Dshop.where(:id => params[:mydshop_id]).first
    $dmenuc = $dshop.dmenucs.build(dmenuc_params)
    $dmenuc.user_id = current_user.id

    respond_to do |format|
      if $dmenuc.save
        format.html { redirect_to mydshop_mydshop_path(id:$dshop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $dmenuc }
      else
        format.html { render :new }
        format.json { render json: $dmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $dmenuc.update(dmenuc_params)
        format.html { redirect_to mydshop_mydshop_path(id:$dshop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $dmenuc }
      else
        format.html { render :edit }
        format.json { render json: $dmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def destroy
    $dmenuc.destroy
    respond_to do |format|
      format.html { redirect_to mydshop_mydshop_path(id:$dshop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_dmenuc
      $dshop = Dshop.where(:id => params[:mydshop_id]).first
      $dmenuc = $dshop.dmenucs.where(:id => params[:id]).first
    end
    
    def dmenuc_params
      params.require(:dmenuc).permit(:dshop_id, :shopname, :user_id, :name)
    end
end
