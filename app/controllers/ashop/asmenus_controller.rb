class Ashop::AsmenusController < ApplicationController
before_action :set_asmenu, only: [:show, :edit, :update, :destroy]
protect_from_forgery except: :create

  def index
    $asmenuc = Asmenuc.where(:id => params[:asmenuc_id]).first
    $asmenus = $asmenuc.asmenus.all
    render :layout => "shop/ashop/contents"
  end

  def show
  end

  def new
    $asmenuc = Asmenuc.where(:id => params[:asmenuc_id]).first
    $asmenu = $asmenuc.asmenus.build
    render :layout => "shop/ashop/menu_edit"
  end

  def edit
    render :layout => "shop/ashop/contents"
  end

  def create
    $asmenuc = Asmenuc.where(:id => params[:asmenuc_id]).first
    $asmenu = $asmenuc.asmenus.build(asmenu_params)

    respond_to do |format|
      if $asmenu.save
        format.html { redirect_to ashop_asmenuc_asmenus_path, notice: 'Grand was successfully created.' }
        format.json { render :show, status: :created, location: $asmenu }
      else
        format.html { redirect_to new_ashop_asmenuc_asmenu_path(id:$asmenu) }
        format.json { render json: $asmenu.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if $asmenu.update(asmenu_params)
        format.html { redirect_to ashop_asmenuc_asmenus_path, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: $asmenu }
      else
        format.html { render :edit }
        format.json { render json: $asmenu.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    $asmenu.destroy
    respond_to do |format|
      format.html { redirect_to ashop_asmenuc_asmenus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_asmenu
      $asmenuc = Asmenuc.where(:id => params[:asmenuc_id]).first
      $asmenu = $asmenuc.asmenus.where(:id => params[:id]).first
    end


    def asmenu_params
      params.require(:asmenu).permit(:asmenuc_id, :name, :menuname, :menudetail)
    end
end
