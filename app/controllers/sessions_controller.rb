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
      render action: 'new'
    end
  end

  def login_user
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to dashboard_path, flash:{notice:"#{@user.first_name} you are logged in!"}
    else
      render action: 'new'
    end
  end

  def login_tailor
    @tailor = Tailor.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @tailor
      session[:tailor_id] = @tailor.id
      redirect_to @tailor, flash:{notice:"#{@tailor.first_name} you are logged in!"}
    else
      render action: 'new', flash:{notice:"please try to login again"}
    end
  end

  def destroy
    session[:company_id] = nil
    session[:user_id] = nil
    session[:tailor_id] = nil
    redirect_to '/'
  end
end
