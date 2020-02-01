class Ashop::AmenucsController < ApplicationController
  before_action :set_amenuc, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    $ashop = Ashop.where(:id => params[:ashop_id]).first
    $amenucs = $ashop.amenucs.all
  end

  def show
    redirect_to ashop_amenuc_amenus_path(amenuc_id:$amenuc)
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  private

    def set_amenuc
      @ashop = Ashop.where(:id => params[:ashop_id]).first
      @amenuc = @ashop.amenucs.where(:id => params[:id]).first
    end
    
    def amenuc_params
      params.require(:amenuc).permit(:ashop_id, :shopname, :user_id, :name)
    end
end
