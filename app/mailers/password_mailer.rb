class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  # similar to a controller where you set the params and then send to the users email
  def reset
    # comes from the globalid github gem, included in rails ***
    @token = params[:user].signed_id(purpose: 'password_reset', expires_in: 15.minutes)

    mail to: params[:user].email
  end
end
