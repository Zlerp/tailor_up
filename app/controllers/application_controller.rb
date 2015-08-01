class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_company
    @current_company ||= Company.find(session[:id])
  end

  def check_logged_in
    redirect_to root_path
  end
end
