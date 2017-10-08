class RegistrationMailer < ApplicationMailer

  def registration_mailer(public_user)
    @publicuser = public_user
    mail to: @publicuser.email,
    subject: "Welcome to our site!"
  end


end