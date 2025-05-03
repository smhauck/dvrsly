class RegistrationsController < ApplicationController
  before_action :resume_session, only: :new
  allow_unauthenticated_access only: %i[ new create confirmation ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
    redirect_to root_url if authenticated?
  end

  def confirmation
  end

  def confirm
puts "#####################################################"
puts "#####################################################"
puts "DEF CONFIRM"
puts "#####################################################"
    if user = User.authenticate_by(params.permit(:email_address, :password))
puts "user = user.authenticate_by"
puts "#####################################################"
puts "#####################################################"
      if user.confirmation_token == params.permit(:confirmation_token)
puts "user.confirmation_token == params confirmation token"
puts "#####################################################"
        user.confirmed = true
        if user.save
          start_new_session_for user
          redirect_to root_url
        else
          redirect_to root_url, alert: "Not Saved: Invalid Confirmation Token"
        end
      else
        redirect_to root_url, alert: "Invalid Confirmation Token"
      end
    else
      redirect_to root_url, alert: "Please check your email address and password"
puts "#####################################################"
puts "#####################################################"
puts "user not authenticated by params"
puts "#####################################################"
puts "#####################################################"
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
