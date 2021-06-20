class TweetsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_tweet, only: %i[edit update destroy]

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
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "Updated the tweet."
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, alert: "Tweet was sucessfully un-scheduled"
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :publish_at, :twitter_account_id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
