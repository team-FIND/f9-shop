class TopsController < ApplicationController
  before_action :set_top, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  protect_from_forgery except: :updete

  def index
    $tops = Top.all
  end

  def show
    redirect_to top_areas_path(top_id:$top)
  end

  def new
    $top = Top.new
  end

  def edit
  end

  def create
    $top = Top.new(top_params)

    respond_to do |format|
      if $top.save
        format.html { redirect_to tops_path, notice: 'Top was successfully created.' }
        format.json { render :show, status: :created, location: $top }
      else
        format.html { render :new }
        format.json { render json: $top.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $top.update(top_params)
        format.html { redirect_to tops_path, notice: 'Top was successfully updated.' }
        format.json { render :show, status: :ok, location: $top }
      else
        format.html { render :edit }
        format.json { render json: $top.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $top.destroy
    respond_to do |format|
      format.html { redirect_to tops_url, notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_top
      $top = Top.where(:name => params[:id]).first
    end
    
    def top_params
      params.require(:top).permit(:name)
    end
end
