class CompaniesController < ApplicationController

  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def show
    # @tailor = Tailor.new
    @tailor = current_company.tailors
  end

  def new
    @company = Company.new
  end

  def index
  end

  def dataLog
    @tailors = current_company.tailors
      @company = current_company
      UserMailer.send_report_company(@company).deliver
      redirect_to companies_path, flash:{notice: 'Data has been emailed'}
  end

  def create
    @company = Company.new company_params
    if @company.save
      log_in_company(@company)
      redirect_to companies_path, notice: 'Company: #{@company.name} has been created!'
    else
      redirect_to :new
    end
  end

  def edit
  end

  def update
    if company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated!'
    else
      render :edit
    end
  end

  def destroy
  @company.destroy
  end


  private

  def set_company
    # company_id is stored in the sessions, not params!!!!
    @company = Company.find(session[:company_id])
  end

  def company_params
    params.require(:company).permit(:name, :email, :password, :password_confirmation, :location)
  end

end
