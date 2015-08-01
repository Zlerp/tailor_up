class TailorsController < ApplicationController

  def new
  @tailor = Tailor.new
  end

  def create
  @tailor = Tailor.new tailor_params
    if @tailor.save
    redirect_to root_path, notice: 'Tailor: #{@tailor.first_name} #{@tailor.last_name} has been created!'
    else
    render :new
  end
end
private

def set_tailor
  @tailor = Tailor.find(params[:id])
end

def tailor_params
  params.require(:tailor).permit(:first_name, :last_name, :email, :password, :password_confirmation, :location, :phone, :avatar)
end

end
