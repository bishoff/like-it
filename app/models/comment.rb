class Comment < ActiveRecord::Base
  attr_accessible :user_id, :photo_id, :text
  
  validates :text, :length => {:minimum => 1, :maximum => 255}

  belongs_to :user, :counter_cache => true
  belongs_to :photo

  has_many :events, :as => :eventtable

  after_create :event_comment

  def event_comment
    self.events.create(:user_id => self.user.id, :eventtable_body => self.text)
  end

end