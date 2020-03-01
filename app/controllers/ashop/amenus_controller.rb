class Ashop::AmenusController < ApplicationController
  before_action :set_amenu, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $amenuc = Amenuc.where(:id => params[:amenuc_id]).first
    $amenus = $amenuc.amenus.all
    render :layout => "menu_category"
  end

  def show
    redirect_to ashop_amenu_foods_path(amenu_id:$amenu)
  end

  def new
    $amenuc = Amenuc.where(:id => params[:amenuc_id]).first
    $amenu = $amenuc.amenus.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $amenuc = Amenuc.where(:id => params[:amenuc_id]).first
    $amenu = $amenuc.amenus.build(amenu_params)

    respond_to do |format|
      if $amenu.save
        format.html { redirect_to ashop_amenuc_amenus_path, notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $amenu }
      else
        format.html { redirect_to new_ashop_amenuc_amenu_path(id:$amenu) }
        format.json { render json: $amenu.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $amenu.update(amenu_params)
        format.html { redirect_to ashop_amenuc_amenus_path, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $amenu }
      else
        format.html { render :edit }
        format.json { render json: @amenu.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    $amenu.destroy
    respond_to do |format|
      format.html { redirect_to ashop_amenuc_amenus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_amenu
      $amenuc = Amenuc.where(:id => params[:amenuc_id]).first
      $amenu = $amenuc.amenus.where(:id => params[:id]).first
    end


    def amenu_params
      params.require(:amenu).permit(:amenuc_id, :user_id, :name, :time1, :time2, :time3, :time4)
    end
end
