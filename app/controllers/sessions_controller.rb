class SessionsController < ApplicationController
  def new_company
  end
  def new_tailor_session
  end
  def new_user_session
  end



  def create
    @company = Company.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @company
      session[:company_id] = @company.id
      redirect_to companies_path
    else
      render action: 'new'
    end
  end

  def destroy
    session[:company_id] = nil
    redirect_to '/'
  end
end
