class GcategoriesController < ApplicationController
  before_action :set_gcategory, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  protect_from_forgery except: :updete

  def index
    $gcategories = Gcategory.all
    render :layout => "app3"
  end

  def show
  end

  def new
    $gcategory = Gcategory.new
    render :layout => "app3"
  end

  def edit
    render :layout => "app3"
  end

  def create
    $gcategory = Gcategory.new(gcategory_params)

    respond_to do |format|
      if $gcategory.save
        format.html { redirect_to gcategories_path, notice: 'Gcategory was successfully created.' }
        format.json { render :show, status: :created, location: $gcategory }
      else
        format.html { render :new }
        format.json { render json: $gcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $gcategory.update(gcategory_params)
        format.html { redirect_to gcategories_path, notice: 'Gcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $gcategory }
      else
        format.html { render :edit }
        format.json { render json: $gcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $gcategory.destroy
    respond_to do |format|
      format.html { redirect_to gcategories_url, notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_gcategory
      $gcategory = Gcategory.where(:name => params[:id]).first
    end
    
    def gcategory_params
      params.require(:gcategory).permit(:name)
    end
end
