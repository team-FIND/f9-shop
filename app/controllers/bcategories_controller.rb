class BcategoriesController < ApplicationController
  before_action :set_bcategory, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  protect_from_forgery except: :updete

  def index
    $bcategories = Bcategory.all
    render :layout => "app3"
  end

  def show
  end

  def new
    $bcategory = Bcategory.new
    render :layout => "app3"
  end

  def edit
    render :layout => "app3"
  end

  def create
    $bcategory = Bcategory.new(bcategory_params)

    respond_to do |format|
      if $bcategory.save
        format.html { redirect_to bcategories_path, notice: 'Bcategory was successfully created.' }
        format.json { render :show, status: :created, location: $bcategory }
      else
        format.html { render :new }
        format.json { render json: $bcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $bcategory.update(bcategory_params)
        format.html { redirect_to bcategories_path, notice: 'Bcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $bcategory }
      else
        format.html { render :edit }
        format.json { render json: $bcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $bcategory.destroy
    respond_to do |format|
      format.html { redirect_to bcategories_url, notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_acategory
      $bcategory = Bcategory.where(:name => params[:id]).first
    end
    
    def bcategory_params
      params.require(:bcategory).permit(:name)
    end
end
