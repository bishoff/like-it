class Category < ActiveRecord::Base
  attr_accessible :id, :name, :count
  
  has_many :photos
end