class TailorsController < ApplicationController
  attr_accessor :password, :password_confirmation
  before_action :set_tailor, only: [:show, :edit, :update, :delete, :dashboard]
  before_action :require_logged_in, only: [:create, :new]
  # before_filter :authenticate_user!, only: [:new, :create]

  def new
    @tailors = current_company.tailors.new
  end


  def index
    @tailors = current_company.tailors.all
    # @tailors = Tailors.all

  end

  def edit
    @tailors = current_tailor
  end
  def dashboard
    @tailor = current_tailor
    @appointments = Appointment.all
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
    @tailor = Tailor.find(params[:id])
    @appointments = Appointment.all
  end


  def add_tailor_to_appointment
    @appointment = Appointment.find(params[:id])
    @appointment.tailor = current_tailor
    @appointment.save!
    redirect_to current_tailor
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
    params.require(:tailor).permit(:company_id, :first_name, :last_name, :email, :phone, :location, :password, :remote_image_url, :image)
  end

end
