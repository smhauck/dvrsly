class RegistrationsController < ApplicationController
  before_action :resume_session, only: :new
  allow_unauthenticated_access only: %i[ new create confirmation ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
    redirect_to root_url if authenticated?
  end

  def create
    # check if email_address exists
    #   if not, create user with random password
    # send password reset email
    # end

    if user = User.find_by(email_address: params[:email_address])
      PasswordsMailer.reset(user).deliver_later
    else
      rand_pass = SecureRandom.hex(25)
      user = User.new(email_address: params[:email_address], username: params[:username], password: :rand_pass.to_s, password_confirmation: :rand_pass.to_s)
      if user.save
        PasswordsMailer.reset(user).deliver_later
        redirect_to root_path, notice: "Check your email for confirmation link to create a password"
      else
        redirect_to new_registration_path, alert: "User did not save"
      end
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path, notice: "Successfully Signed Out"
  end
end
