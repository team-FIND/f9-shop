class AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create

  def index
    $top = Top.where(:name => params[:top_id]).first
    $areas = $top.areas.all
    render :layout => "app2"
  end

  def show
    redirect_to area_prefecs_path(area_id:$area)
  end

  def new
    $top = Top.where(:name => params[:top_id]).first
    $area = $top.areas.build
  end

  def edit
  end

  def create
    $top = Top.where(:name => params[:top_id]).first
    $area = $top.areas.build(area_params)

    respond_to do |format|
      if $area.save
        format.html { redirect_to top_areas_path, notice: 'Area was successfully created.' }
        format.json { render :show, status: :created, location: $area }
      else
        format.html { render :new }
        format.json { render json: $area.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $area.update(area_params)
        format.html { redirect_to top_areas_path, notice: 'Area was successfully updated.' }
        format.json { render :show, status: :ok, location: $area }
      else
        format.html { render :edit }
        format.json { render json: $area.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $area.destroy
    respond_to do |format|
      format.html { redirect_to areas_url, notice: 'Area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_area
      $top = Top.where(:name => params[:top_id]).first
      $area = $top.areas.where(:name => params[:id]).first
    end

    def area_params
      params.require(:area).permit(:top_id, :name)
    end
end
