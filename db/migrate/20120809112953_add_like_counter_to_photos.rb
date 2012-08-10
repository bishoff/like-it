class AddLikeCounterToPhotos < ActiveRecord::Migration
  def up
    add_column :photos, :likes_count, :integer, :default => 0
    
    Photo.reset_column_information
    Photo.find(:all).each do |p|
      Photo.update_counters p.id, :likes_count => p.likes.length
    end
  end
  def down
    remove_column :photos, :likes_count
  end
end
