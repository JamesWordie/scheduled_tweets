class TweetsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Current.user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :publish_at, :twitter_account_id)
  end
end
