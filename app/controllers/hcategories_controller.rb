class HcategoriesController < ApplicationController
  before_action :set_hcategory, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  protect_from_forgery except: :updete

  def index
    $hcategories = Hcategory.all
    render :layout => "app3"
  end

  def show
  end

  def new
    $hcategory = Hcategory.new
    render :layout => "app3"
  end

  def edit
    render :layout => "app3"
  end

  def create
    $hcategory = Hcategory.new(hcategory_params)

    respond_to do |format|
      if $hcategory.save
        format.html { redirect_to hcategories_path, notice: 'Hcategory was successfully created.' }
        format.json { render :show, status: :created, location: $hcategory }
      else
        format.html { render :new }
        format.json { render json: $hcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $hcategory.update(hcategory_params)
        format.html { redirect_to hcategories_path, notice: 'Hcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $hcategory }
      else
        format.html { render :edit }
        format.json { render json: $hcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $hcategory.destroy
    respond_to do |format|
      format.html { redirect_to hcategories_url, notice: 'Hcategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_hcategory
      $hcategory = Hcategory.where(:name => params[:id]).first
    end
    
    def hcategory_params
      params.require(:hcategory).permit(:name)
    end
end
