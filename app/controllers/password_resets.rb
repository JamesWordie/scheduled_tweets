class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      # send email
      # .with is setting up params to access user, reset for resetting password, deliver_later for background job
      # can do .deliver_now but will delay result
      PasswordMailer.with(user: @user).reset.deliver_now
    end
    redirect_to root_path, notice: "If an account with that email was found, we have sent an email to that password."
  end
end
