class UserMailer < ApplicationMailer
default :from => "zhpdeals@gmail.com"

def registration_confirmation(user)
  @user = user
  mail(:to => user.email, :subject => "Registration email")
end

def emails(appointment, subject)
  @appointment = appointment
  mail(:to => appointment.user.email, :subject => subject )
end

def appointment_booked(appointment)
  emails(appointment, "Appointment Booked with TailorUp!")
end

def appointment_processing(appointment)
  emails(appointment, "Your Alterations are now taking place!")
end

def appointment_delivery(appointment)
  emails(appointment, "Your TailorUp Alterations are ready for drop off!")
end

def appointment_complete(appointment)
  emails(appointment, "Thanks for using TailorUp!")
end
def forgot_user_password(user)
  @user = user
  mail(:to => user.email, :subject => "TailorUp Password Reset")
end

end
