class ContactMailer < ApplicationMailer
  default from: "projecttest0000@gmail.com"

  def contact_me(email, name, message)
    @message = message
    mail(:from => email,
         :to => 'multiplexerprivate@gmail.com',
         :subject => "A new contact form message from " + name)
  end
end