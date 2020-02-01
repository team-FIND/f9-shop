class FcategoriesController < ApplicationController
  before_action :set_fcategory, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  protect_from_forgery except: :updete

  def index
    $fcategories = Fcategory.all
    render :layout => "app3"
  end

  def show
  end

  def new
    $fcategory = Fcategory.new
    render :layout => "app3"
  end

  def edit
    render :layout => "app3"
  end

  def create
    $fcategory = Fcategory.new(fcategory_params)

    respond_to do |format|
      if $fcategory.save
        format.html { redirect_to fcategories_path, notice: 'Fcategory was successfully created.' }
        format.json { render :show, status: :created, location: $fcategory }
      else
        format.html { render :new }
        format.json { render json: $fcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $fcategory.update(fcategory_params)
        format.html { redirect_to fcategories_path, notice: 'Fcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $fcategory }
      else
        format.html { render :edit }
        format.json { render json: $fcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $fcategory.destroy
    respond_to do |format|
      format.html { redirect_to fcategories_url, notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_fcategory
      $fcategory = Fcategory.where(:name => params[:id]).first
    end
    
    def fcategory_params
      params.require(:fcategory).permit(:name)
    end
end
