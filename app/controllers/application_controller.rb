class ApplicationController < ActionController::Base
before_action :store_current_location, unless: :devise_controller? 
before_action :set_search
before_action :set_current_user
protect_from_forgery with: :exception
before_action :configure_permitted_parameters, if: :devise_controller?

  protected

	def set_search
		$search = Ashop.ransack(params[:q])
	end

	def index
		top = Top.where(:name => params[:id])
    	render json: category.areas.select(:id, :name)
	end

  	def access_denied(exception)
	    # 権限がなくてアクセスできないページはダッシュボードへ飛ばしてメッセージを表示
	    if current_user
	      redirect_to admin_root_path, alert: 'permission denied'
	    end
	  end

    def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :username, :password, :password_confirmation, :accepted)}
	end

	def store_current_location
    	store_location_for(:user, request.url)
  	end

  	def after_sign_in_path_for(resource)
	    user_path(id: current_user.id)
	end

	def after_sign_out_path_for(resource)
	    stored_location_for(resource) || new_user_session_path
	end

	 def set_current_user
	  @current_user = User.find_by(id: session[:username])
	end

end
