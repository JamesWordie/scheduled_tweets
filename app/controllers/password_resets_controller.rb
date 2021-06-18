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

  def edit
    # comes from global id where passing the token allows for single instance of using the link, ! throws error if expires
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: "your token has expired please try again."
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path, notice: "Your password was successfully reset, please sign in."
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
