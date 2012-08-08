class AddAttachmentAddressToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.has_attached_file :address
    end
  end

  def self.down
    drop_attached_file :photos, :address
  end
end
