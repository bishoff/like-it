class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do
    Event.create(:eventtable_type => 'Navigation', :eventtable_body => request.env["REQUEST_URI"], :user_id => current_user.id) if current_user
  end

end
