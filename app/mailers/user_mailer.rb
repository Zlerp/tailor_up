class UserMailer < ApplicationMailer
default :from => "TailorUpMiami@gmail.com"

def registration_confirmation(user)
  @user = user
  mail(:to => user.email, :subject => "Registration email")
end

def emails(appointment, subject)
  @appointment = appointment
  mail(:to => appointment.user.email, :subject => subject )
end

def appointment_booked(user)
  @user = user
  mail(:to => user.email, :subject => "Your TailorUp Appointment was Booked!")
end
def appointment_bookedT(tailor)
  @tailor = tailor
  mail(:to => tailor.email, :subject => "An Appointment was Booked!")
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

def send_report_tailor(tailor)
  @tailor = tailor
        mail(:to => tailor.email, :subject=>"TailorReports")
end
def send_report_company(company)
  @company = company
        mail(:to => company.email, :subject=>"CompanyReports")
  end
end
