class RegistrationsController < ApplicationController
  before_action :resume_session, only: :new
  allow_unauthenticated_access only: %i[ new create confirmation ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
    redirect_to root_url if authenticated?
  end

  def confirmation

    # look up the user then confirm the token matches
    @user = User.where("id =?", @uid).first
    if @user.present?

      puts "==============================================================================="
puts "USER PRESENT:"
puts @user.to_yaml

puts "user.confirmation_token"
puts @user.confirmation_token
      puts "==============================================================================="
      if @user.confirmation_token == @token
      puts "==============================================================================="
      puts "==============================================================================="
      puts "==============================================================================="
      puts "==============================================================================="
      puts "==============================================================================="
      puts "CONFIRMED!!!"
      puts "==============================================================================="
      puts "==============================================================================="
      puts "==============================================================================="
      puts "==============================================================================="
      puts "==============================================================================="

        @user.confirmed = true
        @user.confirmed_at = Time.current
        if @user.save
          redirect_to root_path, notice: "Email Confirmed"
        else
          redirect_to root_path, alert: "Confirmation Token Does Not Match"
        end

      else
      puts "==============================================================================="
      puts "==============================================================================="
      puts "==============================================================================="
      puts "NOT CONFIRMED!!!"
      puts "==============================================================================="
      puts "==============================================================================="
      puts "==============================================================================="
      end
    else
      puts "==============================================================================="
      puts "==============================================================================="
      puts "==============================================================================="
      puts "NO USER FOUND!!!"
      puts "==============================================================================="
      puts "==============================================================================="
      puts "==============================================================================="
    end

  end

  def create

    user = User.new(params.permit(:email_address, :username, :password))
    user.confirmation_token = SecureRandom.hex(15)
    user.confirmation_sent_at = Time.current

    if user.save
      UserMailer.with(user: user).sign_up_confirmation_email.deliver_now

      redirect_to after_authentication_url, notice: "Successfully Signed Up"
    else
      # redirect_to root_path, alert: "Try another email address or password."
      print "ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT = "
      puts alert
      # redirect_to root_path, alert: "Try another email address or password."
      redirect_to root_path, alert: "prohibited username"
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path, notice: "Successfully Signed Out"
  end
end
