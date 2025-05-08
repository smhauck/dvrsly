class UserMailer < ApplicationMailer

  def confirmation(user)

    @user = user
    mail subject: "Reset your password", to: user.email_address

  end

  def welcome_email
    @user = params[:user]
    @url  = "http://www.dvrsly.com/login"
    mail(to: @user.email_address, subject: "Welcome to DVRSLY")
  end

end
