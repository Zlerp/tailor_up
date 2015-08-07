module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end
  def log_in_company(company)
    session[:company_id] = company.id
  end

end
