class Ashop::AtmenusController < ApplicationController
before_action :set_atmenu, only: [:show, :edit, :update, :destroy]
protect_from_forgery except: :create

  def index
    $atmenuc = Atmenuc.where(:id => params[:atmenuc_id]).first
    $atmenus = $atmenuc.atmenus.all
    render :layout => "menu_category"
  end

  def show
    redirect_to ashop_atmenu_atakeouts_path(atmenu_id:$atmenu)
  end

  def new
    $atmenuc = Atmenuc.where(:id => params[:atmenuc_id]).first
    $atmenu = $atmenuc.atmenus.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $atmenuc = Atmenuc.where(:id => params[:atmenuc_id]).first
    $atmenu = $atmenuc.atmenus.build(atmenu_params)

    respond_to do |format|
      if $atmenu.save
        format.html { redirect_to ashop_atmenuc_atmenus_path, notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $atmenu }
      else
        format.html { redirect_to new_ashop_atmenuc_atmenu_path(id:$atmenu) }
        format.json { render json: $atmenu.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $atmenu.update(atmenu_params)
        format.html { redirect_to ashop_atmenuc_atmenus_path, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $atmenu }
      else
        format.html { render :edit }
        format.json { render json: @atmenu.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    $atmenu.destroy
    respond_to do |format|
      format.html { redirect_to ashop_atmenuc_atmenus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_atmenu
      $atmenuc = Atmenuc.where(:id => params[:atmenuc_id]).first
      $atmenu = $atmenuc.atmenus.where(:id => params[:id]).first
    end


    def atmenu_params
      params.require(:atmenu).permit(:atmenuc_id, :name, :time1, :time2, :time3, :time4)
    end
end
