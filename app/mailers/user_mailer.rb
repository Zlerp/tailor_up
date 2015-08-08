class UserMailer < ApplicationMailer
default :from => "zhpdeals@gmail.com"


def registration_confirmation(user)
  mail(:to => user.email, :subject => "Registration email")
end
end
