class RegistrationMailer < ApplicationMailer

  def registration_mailer(public_user)
    @publicuser = public_user

    mail(to: public_user.email, subject: "Welcome to our site!")
  end


end