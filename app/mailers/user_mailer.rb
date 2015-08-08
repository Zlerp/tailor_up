class UserMailer < ApplicationMailer
default :from => "zhpdeals@gmail.com"



def registration_confirmation(user)
  @user = user
  mail(:to => user.email, :subject => "Registration email")
end

def appointment_booked(appointment)
  @appointment = appointment
  mail(:to => appointment.user.email, :subject =>"Appointment Booked!")
end
end
