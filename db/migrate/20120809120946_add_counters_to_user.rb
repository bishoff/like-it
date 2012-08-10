class AddCountersToUser < ActiveRecord::Migration
  def up
    add_column :users, :likes_count, :integer, :default => 0
    add_column :users, :comments_count, :integer, :default => 0



    User.reset_column_information
    User.find(:all).each do |u|
      User.update_counters u.id, :likes_count => u.likes.length, :comments_count => u.comments.length
    end

  end

  def down
    remove_column :users, :likes_count
    remove_column :users, :comments_count
  end
end
