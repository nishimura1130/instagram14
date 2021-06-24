class FeedsController < ApplicationController
  before_action :set_feed, only: %i[ show edit update destroy ]

  # GET /feeds or /feeds.json
  def index
    @feeds = Feed.all
  end

  # GET /feeds/1 or /feeds/1.json
  def show
    @favorite = current_user.favorites.find_by(feed_id: @feed.id)
  end

  # GET /feeds/new
  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end

  def confirm
    @feed = Feed.new(feed_params)  
  end

  # GET /feeds/1/edit
  def edit
  end

  # POST /feeds or /feeds.json
  def create
    @feed = current_user.feeds.build(feed_params)
    if @feed.save
      # SEND MAIL 
      FeedMailer.feed_mail(@feed).deliver  
      redirect_to feeds_path, notice: 'Feed was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /feeds/1 or /feeds/1.json
  def update
    if @feed.update(feed_params)
      redirect_to feeds_[ath], notice: "Feed was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /feeds/1 or /feeds/1.json
  def destroy
    @feed.destroy
    redirect_to feeds_url, notice: "Feed was successfully destroyed."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_feed
    @feed = Feed.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def feed_params
    params.require(:feed).permit(:image, :image_cache, :comment)
  end
end
