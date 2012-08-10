class NavigationsController < ApplicationController
  
  def index
    @users = User.all
  end

  def show_likes
    @user_photos = User.find(params[:user_id]).photos
  end
  
  def show_comments
    @user_comments = User.find(params[:user_id]).comments
  end

  def show_navigations
    @navigations = Event.find_all_by_user_id_and_eventtable_type(params[:user_id], :Navigation)
  end
end