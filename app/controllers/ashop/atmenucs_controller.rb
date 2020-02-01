class Ashop::AtmenucsController < ApplicationController
  before_action :set_atmenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create

  def index
    $ashop = Ashop.where(:id => params[:ashop_id]).first
    $atmenucs = $ashop.atmenucs.all
  end

  def show
    redirect_to ashop_atmenuc_atmenus_path(atmenuc_id:$atmenuc)
  end

  def new
    $ashop = Ashop.where(:id => params[:ashop_id]).first
    $atmenuc = $ashop.atmenucs.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $ashop = Ashop.where(:id => params[:ashop_id]).first
    $atmenuc = $ashop.atmenucs.build(atmenuc_params)

    respond_to do |format|
      if $atmenuc.save
        format.html { redirect_to prefec_ashop_ashop_path(prefec_id:$prefec, id:$ashop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $atmenuc }
      else
        format.html { render :new }
        format.json { render json: $atmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $atmenuc.update(atmenuc_params)
        format.html { redirect_to prefec_ashop_ashop_path(prefec_id:$prefec, id:$ashop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $atmenuc }
      else
        format.html { render :edit }
        format.json { render json: $atmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $amenuc.destroy
    respond_to do |format|
      format.html { redirect_to prefec_ashop_ashop_path(prefec_id:$prefec, id:$ashop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_atmenuc
      $ashop = Ashop.where(:id => params[:ashop_id]).first
      $atmenuc = $ashop.atmenucs.where(:id => params[:id]).first
    end
    
    def atmenuc_params
      params.require(:atmenuc).permit(:ashop_id, :shopname, :name)
    end
end
