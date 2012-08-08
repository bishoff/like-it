class Like < ActiveRecord::Base
  attr_accessible :user_id, :photo_id

  belongs_to :user
  has_one :photo
end
