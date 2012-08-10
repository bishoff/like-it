class Event < ActiveRecord::Base
  attr_accessible :eventtable_id, :eventtable_type, :eventtable_body, :user_id

  belongs_to :eventtable, :polymorphic => true
  belongs_to :user, :dependent => :destroy

  EVENT = %w{Navigation User Comment Like}
  validates :eventtable_type, :presence => true, :inclusion => {:in => EVENT}

end
