class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      
      t.integer :user_id
      t.integer :eventtable_id
      t.string  :eventtable_type
      t.text    :eventtable_body
      
      t.timestamps
    end
  end
end
