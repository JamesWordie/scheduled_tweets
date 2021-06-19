class OmniauthCallbacksController < ApplicationController
  def twitter
    Rails.logger.info auth
    # current_user same as devise has, setup earlier
    Current.user.twitter_accounts.create(
      name: auth.info.name,
      username: auth.info.nickname,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret
    )
  end

  def auth
    # standard way of grabbing the credentials as a hash, built in to omniauth ALL APIS STANDARD WAY TO OAUTH
    request.env['omniauth.auth']
  end
end
