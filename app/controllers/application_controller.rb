class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_company

  def current_company
    @current_company ||= Company.find_by(id: session[:company_id])
  end

  def require_logged_in
    return true if current_company
    redirect_to root_path
  end
end
