class CreateFollows < ActiveRecord::Migration
  def self.up
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :following_id
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :follows
  end
end
