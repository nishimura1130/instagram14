class CommentsController < ApplicationController
  def create
    feed = Feed.find(params[:feed_id])
    @comment = feed.comments.build(comment_params)
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: feed_url(feed.id))
    else
      flash[:danger] = "コメントできません"
      redirect_back(fallback_location: feed_url(feed.id))
    end 
  end

  def destroy
    feed = Feed.find(params[:feed_id])
  @comment = feed.comments.find(params[:id])
  @comment.destroy
  redirect_back(fallback_location: feed_path(feed)
  end
end
