class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.integer :user_id
      t.string :body
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :tweets
  end
end
