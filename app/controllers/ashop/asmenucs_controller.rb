class Ashop::AsmenucsController < ApplicationController
  before_action :set_asmenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create

  def index
    $ashop = Ashop.where(:id => params[:ashop_id]).first
    $asmenucs = $ashop.asmenucs.all
  end

  def show
    redirect_to ashop_asmenuc_asmenus_path(asmenuc_id:$asmenuc)
  end

  def new
    $ashop = Ashop.where(:id => params[:ashop_id]).first
    $asmenuc = $ashop.asmenucs.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/contents"
  end

  def create
    $ashop = Ashop.where(:id => params[:ashop_id]).first
    $asmenuc = $ashop.asmenucs.build(asmenuc_params)

    respond_to do |format|
      if $asmenuc.save
        format.html { redirect_to myashop_myashop_path(id:$ashop), notice: 'Acategory was successfully created.' }
        format.json { render :show, status: :created, location: $amenuc }
      else
        format.html { render :new }
        format.json { render json: $asmenuc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $asmenuc.update(asmenuc_params)
        format.html { redirect_to prefec_ashop_ashop_path(prefec_id:$prefec, id:$ashop), notice: 'Acategory was successfully updated.' }
        format.json { render :show, status: :ok, location: $asmenuc }
      else
        format.html { render :edit }
        format.json { render json: $asmenuc.errors, status: :unprocessable_entity }
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

    def set_asmenuc
      $ashop = Ashop.where(:id => params[:ashop_id]).first
      $asmenuc = $ashop.asmenucs.where(:id => params[:id]).first
    end
    
    def asmenuc_params
      params.require(:asmenuc).permit(:ashop_id, :shopname, :name)
    end
end
