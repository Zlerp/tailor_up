class TailorsController < ApplicationController
  attr_accessor :password, :password_confirmation
  before_action :set_tailor, only: [:show, :edit, :update, :delete]
  before_action :require_logged_in, only: [:create, :new]
  # before_filter :authenticate_user!, only: [:new, :create]

  def new
<<<<<<< HEAD
    @tailors = current_company.tailors.new
  end
=======
  @tailors = current_company.tailors.new
end
>>>>>>> 4d72b39678644e99c5a2831d071e1b2847373fe9

  def index
    @tailors = current_company.tailors.all
    # @tailors = Tailors.all

  end

  def edit
  end

  def create
    @tailor = current_company.tailors.new(tailor_params)
    if @tailor.save
      redirect_to companies_path, notice: 'Tailor was created!'
    else
      render :new
    end
  end

  def update
    if @tailor.update(tailor_params)
      redirect_to @tailor, notice: 'Tailor was Updated!'
    else
      render :edit
    end
  end

  def show
    @tailor = Tailor.find_by(params[:id])
  end

  def delete
    @tailor.destroy
    redirect_to tailors_url
  end

  def destroy
    @tailor = current_company.tailors.find(params[:id])
    @tailor.destroy
    redirect_to companies_path
  end




  private

  def set_tailor
    # @tailor = current_company.tailors.find(params[:id])
    @tailor = current_tailor    # this will stil let any company edit a tailor
    # @tailor = current_company.tailors.find(session[:user_id])
  end

  def tailor_params
    params.require(:tailor).permit(:company_id, :first_name, :last_name, :email, :phone, :location, :password)
  end

end
