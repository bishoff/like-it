class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :category_id
      t.string :address

      t.timestamps
    end
  end
end
