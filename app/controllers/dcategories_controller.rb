class DcategoriesController < ApplicationController
  before_action :set_dcategory, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  protect_from_forgery except: :updete

  def index
    $dcategories = Dcategory.all
    render :layout => "app3"
  end

  def show
  end

  def new
    $dcategory = Dcategory.new
    render :layout => "app3"
  end

  def edit
    render :layout => "app3"
  end

  def create
    $dcategory = Dcategory.new(dcategory_params)

    respond_to do |format|
      if $dcategory.save
        format.html { redirect_to dcategories_path, notice: 'Dcategory was successfully created.' }
        format.json { render :show, status: :created, location: $dcategory }
      else
        format.html { render :new }
        format.json { render json: $dcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $dcategory.update(dcategory_params)
        format.html { redirect_to dcategories_path, notice: 'Dcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $dcategory }
      else
        format.html { render :edit }
        format.json { render json: $dcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $dcategory.destroy
    respond_to do |format|
      format.html { redirect_to dcategories_url, notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_dcategory
      $dcategory = Dcategory.where(:name => params[:id]).first
    end
    
    def dcategory_params
      params.require(:dcategory).permit(:name)
    end
end
