class Ashop::AtakeoutsController < ApplicationController
before_action :set_atakeout, only: [:show, :edit, :update, :destroy]
protect_from_forgery except: :create

  def index
    $atmenu = Atmenu.where(:id => params[:atmenu_id]).first
    $atakeouts = $atmenu.atakeouts.all
    render :layout => "shop/ashop/contents"
  end

  def show
    $atmenu = Atmenu.where(:id => params[:atmenu_id]).first
    $atakeouts = $atmenu.atakeouts.all
    render :layout => "shop/ashop/foods"
  end

  def new
    $atmenu = Atmenu.where(:id => params[:atmenu_id]).first
    $atakeout = $atmenu.atakeouts.build
    render :layout => "shop/ashop/foods_edit"
  end

  def edit
    $atakeout.topimg.cache! unless $atakeout.topimg.blank?
    $atakeout.foodimg1.cache! unless $atakeout.foodimg1.blank?
    $atakeout.foodimg2.cache! unless $atakeout.foodimg2.blank?    
    $atakeout.foodimg3.cache! unless $atakeout.foodimg3.blank?   
    render :layout => "shop/ashop/foods_edit"
  end

  def create
    $atmenu = Atmenu.where(:id => params[:atmenu_id]).first
    $atakeout = $atmenu.atakeouts.build(atakeout_params)

    respond_to do |format|
      if $atakeout.save
        format.html { redirect_to ashop_atmenu_atakeouts_path, notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $atakeout }
      else
        format.html { render :new }
        format.json { render json: $atakeout.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $atakeout.update(atakeout_params)
        format.html { redirect_to ashop_atmenu_atakeouts_path, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $atakeout }
      else
        format.html { render :edit }
        format.json { render json: $atakeout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    $atakeout.destroy
    respond_to do |format|
      format.html { redirect_to ashop_atmenu_atakeouts_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atakeout
      $atmenu = Atmenu.where(:id => params[:atmenu_id]).first
      $atakeout = $atmenu.atakeouts.where(:id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atakeout_params
      params.require(:atakeout).permit(:atmenu_id, :name, :topimg, :topimg_cache, :foodimg1, :foodimg1_cache, :foodimg2, :foodimg2_cache, :foodimg3, :foodimg3_cache, :foodname1, :foodname2, :price)
    end
end
