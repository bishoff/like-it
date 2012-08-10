class Photo < ActiveRecord::Base
  attr_accessible :category_id, :address, :address_file_name

  belongs_to :category
  
  has_many :comments
  has_many :likes
  has_many :users, :through => :likes

  has_attached_file :address, :styles => { :small => "150x150", :thumb => "128x128>" , :large => "500x500"}
end
