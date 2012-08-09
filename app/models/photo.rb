class Photo < ActiveRecord::Base
  attr_accessible :category_id, :address, :address_file_name

  belongs_to :category
  
  has_many :likes
  has_many :users, :through => :likes

  
  has_many :comments

  has_attached_file :address, :styles => { :small => "150x150", :thumb => "128x128>" }
end
