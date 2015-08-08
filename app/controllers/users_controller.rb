class UsersController < ApplicationController
  attr_accessor :password, :password_confirmation

    before_action :set_user, only: [:show, :edit, :update, :destroy, :dashboard]
    # before_action :require_logged_in_user, only: [:dashboard]

    def show
      @appointment = Appointment.new
    end

    def new
      @user = User.new
    end

    def index
    end

    def edit
    end

    def dashboard
    end

    def create
      @user = User.new user_params
      if @user.save
        log_in(@user)
        UserMailer.registration_confirmation(@user).deliver
        redirect_to dashboard_path
      else
        render :new
      end
    end

    def update
      if @user.update(user_params)
        redirect_to dashboard_path
      else
         redirect_to dashboard_path
      end
    end

    def destroy
      @user.destroy
      redirect_to root_path
    end

    def forgot_password
    end

    def forgot_password_mail
      @user = User.find_by(email: params[:email])
      if @user.nil?
        # Need some logic here
      else
        @user.password = ("#{@user.first_name}Reset")
        @user.password_confirmation = ("#{@user.first_name}Reset")
        if @user.save
          puts "This Saved!!!!!"
          UserMailer.forgot_user_password(@user).deliver
          redirect_to new_session_user_path
        else
          puts "not saved"
        end
      end
    end


    private

    def set_user
      # user_id is stored in the sessions, not params, but until fixed use params.!!!!
      @user = User.find(session[:user_id])
      # @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address, :phone, :zip, :image, :remote_image_url)
    end
end
