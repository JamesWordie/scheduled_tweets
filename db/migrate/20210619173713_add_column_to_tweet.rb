class AddColumnToTweet < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :publish_at, :datetime
    add_column :tweets, :tweet_id, :string
  end
end
