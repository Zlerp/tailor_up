ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "TailorUpMiami@gmail.com",
  :password             => "Wyncodemiami",
  :authentication       => "plain",
  :enable_starttls_autp => true
}
