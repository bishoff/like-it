class Like < ActiveRecord::Base
  attr_accessible :user_id, :photo_id

  validates_uniqueness_of :user_id, :scope => :photo_id

  belongs_to :user, :counter_cache => true
  belongs_to :photo, :counter_cache => true

  has_many :events, :as => :eventtable

  after_create :event_like

  def event_like
    # self.events.create(:user_id => self.user.id)
    self.events.create(:user_id => 1)
  end
end
