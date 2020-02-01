class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

	def show
		@user = User.find(params[:id])
		render :layout => "mypage"
	end

	def mypage
		@user = User.find(params[:id])
		render :layout => "mypage"
	end

	def myshop
		@user = User.where(:id => params[:user_id]).first
		render :layout => "footers"
	end

	def profile
		render :layout => "footers"
	end

	def set_current_user
    	@current_user = User.find_by(id: session[:id])
  	end

  	private

    def set_user
        @user = User.where(:id => params[:user_id]).first
    end
    
    def user_params
      params.require(:user).permit(:ashop_id, :shopname, :user_id, :name)
    end

	
end
