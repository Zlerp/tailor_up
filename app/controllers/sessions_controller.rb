class SessionsController < ApplicationController
  def new_company
  end
  def new_tailor_session
  end
  def new_user_session
  end



  def login_company
    @company = Company.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @company
      session[:company_id] = @company.id
      redirect_to companies_path
    else
      redirect_to new_company_path
    end
  end

  def login_user
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to dashboard_path, flash:{notice:"#{@user.first_name} you are logged in!"}
    else
      redirect_to dashboard_path
    end
  end

  def login_tailor
    @tailor = Tailor.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @tailor
      session[:tailor_id] = @tailor.id
      redirect_to @tailor, flash:{notice:"#{@tailor.first_name} you are logged in!"}
    else
      redirect_to new_session_tailor_path, flash:{notice:"please try to login again"}
    end
  end

  def logout_company
    session[:company_id] = nil
    redirect_to '/'
  end
  def logout_user
    session[:user_id] = nil
    redirect_to '/'
  end
  def logout_tailor
    session[:tailor_id] = nil
    redirect_to '/'
  end
end
