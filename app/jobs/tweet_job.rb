class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.published?

    # rescheduled tweet to the future
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter!
  end
end

# push the publish_at forward
#  noon => 8am

# 8 am sets the tweet_id
# noon hits published? method and does nothing

# push the publish_at backward
#  1pm => 6pm

# 1pm should do nothing, updated time to later in day
# 6pm should set the tweet_id and publish it
