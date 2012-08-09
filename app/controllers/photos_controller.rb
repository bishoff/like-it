class PhotosController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @photos = Photo.includes(:likes).where("likes.user_id=#{current_user.id}").order('likes.photo_id DESC').paginate(:page => params[:page]? params[:page] : 1, :per_page => 5)


    # Client.joins('LEFT OUTER JOIN addresses ON addresses.client_id = clients.id')
      # .all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @comments = Comment.new
    @photo = Photo.find(params[:id])
    @like = Like.new
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :ok }
    end
  end
end
