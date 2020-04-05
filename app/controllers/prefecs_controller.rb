class PrefecsController < ApplicationController
  before_action :set_prefec, only: [:show, :edit, :topad, :newad, :recomad, :update, :destroy]
  protect_from_forgery except: :create


  def index
    $area = Area.where(:name => params[:area_id]).first
    $prefecs = $area.prefecs.all
    render :layout => "city_list"
  end


  def show
    render :layout => "city"
  end

  def new
    $area = Area.where(:name => params[:area_id]).first
    $prefec = $area.prefecs.build
  end

  def edit
    render :layout => "app2"
    $prefec.citytop_img.cache! unless $prefec.citytop_img.blank?
    $prefec.newshop_img1.cache! unless $prefec.newshop_img1.blank?
    $prefec.newshop_img2.cache! unless $prefec.newshop_img2.blank?
    $prefec.newshop_img3.cache! unless $prefec.newshop_img3.blank?
    $prefec.newshop_img4.cache! unless $prefec.newshop_img4.blank?
    $prefec.newshop_img5.cache! unless $prefec.newshop_img5.blank?
    $prefec.newshop_img6.cache! unless $prefec.newshop_img6.blank?
    $prefec.newshop_img7.cache! unless $prefec.newshop_img7.blank?
    $prefec.newshop_img8.cache! unless $prefec.newshop_img8.blank?
    $prefec.newshop_img9.cache! unless $prefec.newshop_img9.blank?
    $prefec.newshop_img10.cache! unless $prefec.newshop_img10.blank?
    $prefec.adshop_img1.cache! unless $prefec.adshop_img1.blank?
    $prefec.adshop_img2.cache! unless $prefec.adshop_img2.blank?
    $prefec.adshop_img3.cache! unless $prefec.adshop_img3.blank?
    $prefec.adshop_img4.cache! unless $prefec.adshop_img4.blank?
    $prefec.adshop_img5.cache! unless $prefec.adshop_img5.blank?
    $prefec.adshop_img6.cache! unless $prefec.adshop_img6.blank?
    $prefec.adshop_img7.cache! unless $prefec.adshop_img7.blank?
    $prefec.adshop_img8.cache! unless $prefec.adshop_img8.blank?
    $prefec.adshop_img9.cache! unless $prefec.adshop_img9.blank?
    $prefec.adshop_img10.cache! unless $prefec.adshop_img10.blank?    
  end

  def topad
    $area = Area.where(:name => params[:area_id]).first
    $prefecs = $area.prefecs.all
    render :layout => "app2"
    $prefec.newshop_img1.cache! unless $prefec.newshop_img1.blank?
    $prefec.newshop_img2.cache! unless $prefec.newshop_img2.blank?
    $prefec.newshop_img3.cache! unless $prefec.newshop_img3.blank?
    $prefec.newshop_img4.cache! unless $prefec.newshop_img4.blank?
    $prefec.newshop_img5.cache! unless $prefec.newshop_img5.blank?
    $prefec.newshop_img6.cache! unless $prefec.newshop_img6.blank?
    $prefec.newshop_img7.cache! unless $prefec.newshop_img7.blank?
    $prefec.newshop_img8.cache! unless $prefec.newshop_img8.blank?
    $prefec.newshop_img9.cache! unless $prefec.newshop_img9.blank?
    $prefec.newshop_img10.cache! unless $prefec.newshop_img10.blank?
    $prefec.adshop_img1.cache! unless $prefec.adshop_img1.blank?
    $prefec.adshop_img2.cache! unless $prefec.adshop_img2.blank?
    $prefec.adshop_img3.cache! unless $prefec.adshop_img3.blank?
    $prefec.adshop_img4.cache! unless $prefec.adshop_img4.blank?
    $prefec.adshop_img5.cache! unless $prefec.adshop_img5.blank?
    $prefec.adshop_img6.cache! unless $prefec.adshop_img6.blank?
    $prefec.adshop_img7.cache! unless $prefec.adshop_img7.blank?
    $prefec.adshop_img8.cache! unless $prefec.adshop_img8.blank?
    $prefec.adshop_img9.cache! unless $prefec.adshop_img9.blank?
    $prefec.adshop_img10.cache! unless $prefec.adshop_img10.blank?     
  end

  def newad
    $area = Area.where(:name => params[:area_id]).first
    $prefecs = $area.prefecs.all
    render :layout => "app2"
    $prefec.newshop_img1.cache! unless $prefec.newshop_img1.blank?
    $prefec.newshop_img2.cache! unless $prefec.newshop_img2.blank?
    $prefec.newshop_img3.cache! unless $prefec.newshop_img3.blank?
    $prefec.newshop_img4.cache! unless $prefec.newshop_img4.blank?
    $prefec.newshop_img5.cache! unless $prefec.newshop_img5.blank?
    $prefec.newshop_img6.cache! unless $prefec.newshop_img6.blank?
    $prefec.newshop_img7.cache! unless $prefec.newshop_img7.blank?
    $prefec.newshop_img8.cache! unless $prefec.newshop_img8.blank?
    $prefec.newshop_img9.cache! unless $prefec.newshop_img9.blank?
    $prefec.newshop_img10.cache! unless $prefec.newshop_img10.blank?
    $prefec.adshop_img1.cache! unless $prefec.adshop_img1.blank?
    $prefec.adshop_img2.cache! unless $prefec.adshop_img2.blank?
    $prefec.adshop_img3.cache! unless $prefec.adshop_img3.blank?
    $prefec.adshop_img4.cache! unless $prefec.adshop_img4.blank?
    $prefec.adshop_img5.cache! unless $prefec.adshop_img5.blank?
    $prefec.adshop_img6.cache! unless $prefec.adshop_img6.blank?
    $prefec.adshop_img7.cache! unless $prefec.adshop_img7.blank?
    $prefec.adshop_img8.cache! unless $prefec.adshop_img8.blank?
    $prefec.adshop_img9.cache! unless $prefec.adshop_img9.blank?
    $prefec.adshop_img10.cache! unless $prefec.adshop_img10.blank?      
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
      params.require(:prefec).permit(:area_id, :name, :citytop_img, :citytop_name, :newshop_img1, :newshop_name1, :newshop_img2, :newshop_name2, :newshop_img3, :newshop_name3, :newshop_img4, :newshop_name4, :newshop_img5, :newshop_name5, :newshop_img6, :newshop_name6, :newshop_img7, :newshop_name7, :newshop_img8, :newshop_name8, :newshop_img9, :newshop_name9, :newshop_img10, :newshop_name10, :adshop_img1, :adshop_name1, :newshop_url1, :newshop_url2, :newshop_url3, :newshop_url4, :newshop_url5, :newshop_url6, :newshop_url7, :newshop_url8, :newshop_url9, :newshop_url10, :adshop_url1, :adshop_url2, :adshop_url3, :adshop_url4, :adshop_url5, :adshop_url6, :adshop_url7, :adshop_url8, :adshop_url9, :adshop_url10 )
    end
end
