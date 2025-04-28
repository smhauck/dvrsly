class UserMailer < ApplicationMailer


  def sign_up_confirmation_email
    # @confirmation_token = SecureRandom.hex(25)
    @prefix = rand(9).to_s + rand(9).to_s + rand(9).to_s
    @user = params[:user]
    puts "==========================================="
    puts "==========================================="
    puts "==========================================="
    puts "==========================================="
    puts "==========================================="
    puts "Confirmation Token: "
    puts @confirmation_token
    puts "User Prefix: "
    puts @prefix
    puts "User: "
    puts @user.to_yaml
    puts "==========================================="
    puts "==========================================="
    puts "==========================================="
    puts "==========================================="
    puts "==========================================="



    @url  = "http://www.dvrsly.com/registrations/confirmation/" + @prefix.to_s + @user.id.to_s + "-" + @user.confirmation_token.to_s
    mail(to: @user.email_address, subject: "DVRSLY Confirmation")
  end

  def welcome_email
    @user = params[:user]
    @url  = "http://www.dvrsly.com/login"
    mail(to: @user.email_address, subject: "Welcome to DVRSLY")
  end

end
