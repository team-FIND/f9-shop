class Ashop::AdmenusController < ApplicationController
before_action :set_admenu, only: [:show, :edit, :update, :destroy]
protect_from_forgery except: :create

  def index
    $admenuc = Admenuc.where(:id => params[:admenuc_id]).first
    $admenus = $admenuc.admenus.all
    render :layout => "shop/ashop/contents"
  end

  def show
    redirect_to ashop_admenu_drinks_path(admenu_id:$admenu)
  end

  def new
    $admenu = Admenuc.where(:id => params[:admenuc_id]).first
    $admenu = $admenuc.admenus.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $admenuc = Admenuc.where(:id => params[:admenuc_id]).first
    $admenu = $admenuc.admenus.build(admenu_params)

    respond_to do |format|
      if $admenu.save
        format.html { redirect_to ashop_admenuc_admenus_path, notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $admenu }
      else
        format.html { redirect_to new_ashop_admenuc_admenu_path(id:$admenu) }
        format.json { render json: $admenu.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $admenu.update(admenu_params)
        format.html { redirect_to ashop_admenuc_admenus_path, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $admenu }
      else
        format.html { render :edit }
        format.json { render json: $admenu.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    $admenu.destroy
    respond_to do |format|
      format.html { redirect_to ashop_admenuc_admenus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_admenu
      $admenuc = Admenuc.where(:id => params[:admenuc_id]).first
      $admenu = $admenuc.admenus.where(:id => params[:id]).first
    end


    def admenu_params
      params.require(:admenu).permit(:admenuc_id, :name, :time1, :time2, :time3, :time4)
    end
end
