class SessionsController < ApplicationController
  def new
  end

  def create
    @company = Company.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @company
      # logged in, Woohoo!!!!
      session[:company_id] = @company.id
      redirect_to tailors_path
    else
      render action: 'new'
    end
  end
end
