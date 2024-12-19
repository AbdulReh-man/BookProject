class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def authenticate_admin!
    unless current_user&.role == 'admin'
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
