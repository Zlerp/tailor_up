class UsersController < ApplicationController
  attr_accessor :password, :password_confirmation

    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def show
      @appointment = Appointment.new
    end

    def new
      @user = User.new
    end

    def index
    end
    def create
      @user = User.new user_params
      if @user.save
        redirect_to root_path, notice: "User logged in!"
      else
        render :new
      end
    end

    private

    def set_user
      # user_id is stored in the sessions, not params!!!!
      @user = User.find(session[:user_id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address, :phone )
    end

end
