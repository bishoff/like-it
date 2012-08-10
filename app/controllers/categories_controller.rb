class CategoriesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
    @name = params[:name]
    @photos = Category.find_by_name(params[:name]).photos.paginate(:page => params[:page]? params[:page] : 1, :per_page => 5)
  end

end