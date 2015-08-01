class TailorsController < ApplicationController
  before_action :set_tailor, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in

  def new
    @tailor = current_company.tailors.new
  end

  def index
    @tailors = current_company.tailors.all
  end

  def edit
  end

  def create
    @tailor = current_company.tailors.new(tailor_params)
    if @tailor.save
      redirect_to @tailor, notice: 'Tailor was created!'
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

  def destroy
    @tailor.destroy
    redirect_to tailors_url
  end

  private

  def set_tailor
    @tailor = current_company.tailors.find(params[:id])
  end

  def tailor_params
    params.require(:tailor).permit(:company_id, :first_name, :last_name, :email, :password)
  end
end
