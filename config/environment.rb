# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    user_name: user,
    password: pass,
    domain: "localhost:3000",
    address: mailserver,
    port: portsmtp,
    authentication: :plain,
    enable_starttls_auto: true
}
