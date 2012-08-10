class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_comment , :only => [:destroy,:update,:edit,:show]

  def index
    @comments = Comment.paginate(:page => params[:page], :per_page => 25).order("created_at")
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      redirect_to '/' << params[:comment][:return_path], notice: 'Comment was successfully created.'
    else
      render action: "new"
    end
  end

  def update

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def find_comment
    unless @comment = Comment.find_by_id(params[:id])
      redirect_to :root , :notice => "not found"
    end
  end

end
