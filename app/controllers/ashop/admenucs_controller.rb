class Ashop::AdmenucsController < ApplicationController
  before_action :set_admenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create

  def index
    $ashop = Ashop.where(:id => params[:ashop_id]).first
    $admenucs = $ashop.admenucs.all
  end

  def show
    redirect_to ashop_admenuc_admenus_path(admenuc_id:$admenuc)
  end

  def new
    $ashop = Ashop.where(:id => params[:ashop_id]).first
    $admenuc = $ashop.admenucs.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/menu_edit"
  end

  def create
    $ashop = Ashop.where(:id => params[:ashop_id]).first
    $admenuc = $ashop.admenucs.build(admenuc_params)

    respond_to do |format|
      if $admenuc.save
        format.html { redirect_to prefec_ashop_ashop_path(prefec_id:$prefec, id:$ashop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $admenuc }
      else
        format.html { render :new }
        format.json { render json: $admenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $admenuc.update(admenuc_params)
        format.html { redirect_to prefec_ashop_ashop_path(prefec_id:$prefec, id:$ashop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $admenuc }
      else
        format.html { render :edit }
        format.json { render json: $admenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    $admenuc.destroy
    respond_to do |format|
      format.html { redirect_to prefec_ashop_ashop_path(prefec_id:$prefec, id:$ashop), notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_admenuc
      $ashop = Ashop.where(:id => params[:ashop_id]).first
      $admenuc = $ashop.admenucs.where(:id => params[:id]).first
    end
    
    def admenuc_params
      params.require(:admenuc).permit(:ashop_id, :shopname, :name)
    end
end
