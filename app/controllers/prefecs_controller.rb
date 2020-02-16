class PrefecsController < ApplicationController
  before_action :set_prefec, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create


  def index
    $area = Area.where(:name => params[:area_id]).first
    $prefecs = $area.prefecs.all
    render :layout => "app1"
  end


  def show
  end


  def new
    $area = Area.where(:name => params[:area_id]).first
    $prefec = $area.prefecs.build
  end


  def edit
    render :layout => "app2"
    $prefec.citytop_img1.cache! unless $prefec.citytop_img1.blank?
    $prefec.newshop_img1.cache! unless $prefec.newshop_img1.blank?
    $prefec.adshop_img1.cache! unless $prefec.adshop_img1.blank?      
  end


  def create
    $area = Area.where(:name => params[:area_id]).first
    $prefec = $area.prefecs.build(prefec_params)

    respond_to do |format|
      if $prefec.save
        format.html { redirect_to area_prefecs_path, notice: 'Prefec was successfully created.' }
        format.json { render :show, status: :created, location: $prefec }
      else
        format.html { render :new }
        format.json { render json: $prefec.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if $prefec.update(prefec_params)
        format.html { redirect_to area_prefecs_path, notice: 'Prefec was successfully updated.' }
        format.json { render :show, status: :ok, location: $prefec }
      else
        format.html { render :edit }
        format.json { render json: $prefec.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    $prefec.destroy
    respond_to do |format|
      format.html { redirect_to prefecs_url, notice: 'Prefec was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_prefec
      $area = Area.where(:name => params[:area_id]).first
      $prefec = $area.prefecs.where(:name => params[:id]).first
    end


    def prefec_params
      params.require(:prefec).permit(:area_id, :name, :citytop_img1, :citytop_name1, :newshop_img1, :newshop_name1, :newshop_img2, :newshop_name2, :newshop_img3, :newshop_name3, :newshop_img4, :newshop_name4, :newshop_img5, :newshop_name5, :newshop_img6, :newshop_name6, :newshop_img7, :newshop_name7, :newshop_img8, :newshop_name8, :newshop_img9, :newshop_name9, :newshop_img10, :newshop_name10, adshop_img1, :adshop_name1 )
    end
end
