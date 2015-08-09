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

def send_report_tailor(tailor)
  @tailor = tailor
        # attachments["test.csv"] = {mime_type: 'text/csv', content: File.read(Rails.root.join('app', 'views', 'user_mailer', 'send_report_tailor.csv'))}
        mail(:to => tailor.email, :subject=>"TailorReports")
                # format.text {render :text => "CSV INFORMTATION!"}
    # end
end
def send_report_tailor(tailor)
  @tailor = tailor
        # attachments["test.csv"] = {mime_type: 'text/csv', content: File.read(Rails.root.join('lib', 'tasks', 'test.csv'))}
        mail(:to => tailor.email, :subject=>"CompanyReports") # do |format|
    #             format.text {render :text => "CSV INFORMTATION!"}
    # end
  end
end
