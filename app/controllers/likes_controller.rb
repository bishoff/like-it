class LikesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @likes = Like.all
  end

  def show
    @like = Like.find(params[:id])
  end

  def new
    @like = Like.new
  end

  def create
    @like = Like.new(params[:like])
    if @like.save
      format.html { redirect_to :back, notice: 'Like was successfully created.' }
    else
      format.html { render action: "new" }
    end
  end

end
