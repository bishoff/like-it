class PhotosController < ApplicationController
  before_filter :authenticate_user!

  def index
    @photos = Photo.order('likes_count DESC').paginate(:page => params[:page]? params[:page] : 1, :per_page => 5)
  end

  def show
    @comments = Comment.new
    @photo = Photo.find(params[:id])
    @like = Like.new
  end

end