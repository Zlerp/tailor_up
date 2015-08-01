class SessionsController < ApplicationController
  def new
  end

  def create
    @company = Company.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @company
      p "*************************************************"
      # logged in, Woohoo!!!!
      session[:company_id] = @company.id
      redirect_to companies_path
    else
      render action: 'new'
    end
  end
end
