class Myhshop::MyhmenucsController < ApplicationController
  before_action :set_hmenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $hshop = Hshop.where(:id => params[:myhshop_id]).first
    $hmenucs = $hshop.hmenucs.all
  end

  def show
    redirect_to myhshop_myhmenuc_mydmenus_path(myhmenuc_id:$hmenuc)
  end

  def new
    $hshop = Hshop.where(:id => params[:myhshop_id]).first
    $hmenuc = $hshop.hmenucs.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $hshop = Hshop.where(:id => params[:myhshop_id]).first
    $hmenuc = $hshop.hmenucs.build(hmenuc_params)
    $hmenuc.user_id = current_user.id

    respond_to do |format|
      if $hmenuc.save
        format.html { redirect_to myhshop_myhshop_path(id:$hshop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $hmenuc }
      else
        format.html { render :new }
        format.json { render json: $hmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $hmenuc.update(hmenuc_params)
        format.html { redirect_to myhshop_myhshop_path(id:$hshop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $hmenuc }
      else
        format.html { render :edit }
        format.json { render json: $hmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def destroy
    $hmenuc.destroy
    respond_to do |format|
      format.html { redirect_to myhshop_myhshop_path(id:$hshop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_hmenuc
      $hshop = Hshop.where(:id => params[:myhshop_id]).first
      $hmenuc = $hshop.hmenucs.where(:id => params[:id]).first
    end
    
    def hmenuc_params
      params.require(:hmenuc).permit(:hshop_id, :shopname, :user_id, :name)
    end
end
