class CreateFeedItems < ActiveRecord::Migration
  def self.up
    create_table :feed_items do |t|
      t.integer :user_id
      t.integer :tweet_id
      t.integer :tweet_user_id
      t.datetime :tweet_created_at
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :feed_items
  end
end
