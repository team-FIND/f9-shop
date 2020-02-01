class AcategoriesController < ApplicationController
  before_action :set_acategory, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  protect_from_forgery except: :updete

  def index
    $acategories = Acategory.all
    render :layout => "app3"
  end

  def show
  end

  def new
    $acategory = Acategory.new
    render :layout => "app3"
  end

  def edit
    render :layout => "app3"
  end

  def create
    $acategory = Acategory.new(acategory_params)

    respond_to do |format|
      if $acategory.save
        format.html { redirect_to acategories_path, notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $acategory }
      else
        format.html { render :new }
        format.json { render json: $acategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $acategory.update(acategory_params)
        format.html { redirect_to acategories_path, notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $acategory }
      else
        format.html { render :edit }
        format.json { render json: $acategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $acategory.destroy
    respond_to do |format|
      format.html { redirect_to acategories_url, notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_acategory
      $acategory = Acategory.where(:name => params[:id]).first
    end
    
    def acategory_params
      params.require(:acategory).permit(:name)
    end
end
