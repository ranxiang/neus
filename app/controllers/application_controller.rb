class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
    def authenticate_admin_user!
      redirect_to :root, notice: 'You have no permission to visit.' unless current_user && current_user.admin?
    end
end
