class PrefecsController < ApplicationController
  before_action :set_prefec, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create


  def index
    $area = Area.where(:name => params[:area_id]).first
    $prefecs = $area.prefecs.all
  end


  def show
  end


  def new
    $area = Area.where(:name => params[:area_id]).first
    $prefec = $area.prefecs.build
  end


  def edit
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
      params.require(:prefec).permit(:area_id, :name, :ad1, :ad2, :ad3, :ad4, :ad5, :ad6, :ad7, :ad8, :ad9, :ad10, :adname1, :adname2, :adname3, :adname4, :adname5, :adname6, :adname7, :adname8, :adname9, :adname10 )
    end
end
