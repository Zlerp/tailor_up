class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_company, :current_user, :current_tailor

  include SessionsHelper

  def current_company
    @current_company ||= Company.find_by(id: session[:company_id])
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def current_tailor
    @current_tailor ||= Tailor.find_by(id: session[:tailor_id])
  end


  def require_logged_in
    return true if current_company
    redirect_to root_path
  end

  def require_logged_in_user
    redirect_to new_user_session_path unless current_user
  end
end
