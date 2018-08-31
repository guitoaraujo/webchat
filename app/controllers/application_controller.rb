class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	skip_before_action :verify_authenticity_token
	#protect_from_forgery with: :exception
	#protect_from_forgery prepend: true
	
	before_action :configure_permitted_parameters, if: :devise_controller?
	
	protected
	
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
			devise_parameter_sanitizer.permit(:account_update, keys: [:name])
		end
end
