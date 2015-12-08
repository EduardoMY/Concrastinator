# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true

  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :domain               => "gmail.com",
      :user_name            => "concrastinator.1@gmail.com",
      :password             => "medina11",
      :authentication       => :login,
      :enable_starttls_auto => true
  } 
