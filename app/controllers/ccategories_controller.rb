class CcategoriesController < ApplicationController
  before_action :set_ccategory, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  protect_from_forgery except: :updete

  def index
    $ccategories = Ccategory.all
    render :layout => "app3"
  end

  def show
  end

  def new
    $ccategory = Ccategory.new
    render :layout => "app3"
  end

  def edit
    render :layout => "app3"
  end

  def create
    $ccategory = Ccategory.new(ccategory_params)

    respond_to do |format|
      if $ccategory.save
        format.html { redirect_to ccategories_path, notice: 'Ccategory was successfully created.' }
        format.json { render :show, status: :created, location: $ccategory }
      else
        format.html { render :new }
        format.json { render json: $ccategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $ccategory.update(ccategory_params)
        format.html { redirect_to ccategories_path, notice: 'Ccategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $ccategory }
      else
        format.html { render :edit }
        format.json { render json: $ccategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $ccategory.destroy
    respond_to do |format|
      format.html { redirect_to ccategories_url, notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_ccategory
      $ccategory = Ccategory.where(:name => params[:id]).first
    end
    
    def ccategory_params
      params.require(:ccategory).permit(:name)
    end
end
