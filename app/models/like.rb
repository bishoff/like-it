class Like < ActiveRecord::Base
  attr_accessible :user_id, :photo_id

  validates_uniqueness_of :user_id, :scope => :photo_id

  belongs_to :user
  belongs_to :photo
end
