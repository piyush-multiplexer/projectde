class Contact < MailForm::Base

  append :remote_ip, :user_agent
  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message, validate: true
  attribute :nickname, captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
        subject: "Contact/Us",
        to: "projecttest0000@gmail.com",
        from: %("#{name}" <#{email}>)
    }
  end
end
