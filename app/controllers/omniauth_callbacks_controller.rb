class OmniauthCallbacksController < ApplicationController
  def twitter
    Rails.logger.info auth
    # current_user same as devise has, setup earlier
    twitter_account = Current.user.twitter_accounts
                             .where(username: auth.info.nickname)
                             .first_or_initialize
    twitter_account.update(
      name: auth.info.name,
      username: auth.info.nickname,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret
    )

    redirect_to twitter_accounts_path, notice: "Successfully connected your account"
  end

  def auth
    # standard way of grabbing the credentials as a hash, built in to omniauth ALL APIS STANDARD WAY TO OAUTH
    request.env['omniauth.auth']
  end
end
