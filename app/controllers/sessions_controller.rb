# flash[:notice]
class SessionsController < ApplicationController
  def new_company
  end
  def new_tailor_session
  end
  def new_user_session
  end



  def login_company

    @company = Company.find_by(email: params[:email].downcase).try(:authenticate, params[:password])
    @company = Company.find_by(email: params[:email].downcase).try(:authenticate, params[:password])

    if @company
      session[:company_id] = @company.id
      redirect_to companies_path
    else
      redirect_to new_company_path, flash:{error:" invalid username or password"}
    end
  end

  def login_user
    # @user = User.find_by(email: params[:email].downcase).try(:authenticate, params[:password])
    @user = User.find_by(email: params[:email].downcase).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to dashboard_path, flash:{notice:"#{@user.first_name} you are logged in"}
    else
      redirect_to new_session_user_path, flash:{error:" invalid username or password"}
      puts "*************NOT WORKING*********************************************"
    end
  end

  def login_tailor
    # @tailor = Tailor.find_by(email: params[:email].downcase).try(:authenticate, params[:password])
    @tailor = Tailor.find_by(email: params[:email].downcase).try(:authenticate, params[:password])
    if @tailor
      session[:tailor_id] = @tailor.id
      redirect_to tailors_dashboard_path, flash:{notice:"#{@tailor.first_name} you are logged in!"}
    else
      redirect_to new_session_tailor_path, flash:{error:" invalid username or password"}
    end
  end

  def logout
    session[:tailor_id] = nil
    session[:user_id] = nil
    session[:company_id] = nil
    redirect_to '/', flash:{notice:"you have logged out"}
  end
end
