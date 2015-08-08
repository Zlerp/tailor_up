ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "zhpdeals@gmail.com",
  :password             => "Hunter620620",
  :authentication       => "plain",
  :enable_starttls_autp => true
}
