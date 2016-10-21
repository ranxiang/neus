class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :prepare_exception_notifier

  protected
  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	end
	def authenticate_admin_user!
		redirect_to :root, notice: 'You have no permission to visit.' unless current_user && current_user.admin?
	end

	private
	def prepare_exception_notifier
		request.env["exception_notifier.exception_data"] = {
			:current_user => current_user
		}
	end
end
