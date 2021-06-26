class FavoritesController < ApplicationController

  def index
    @favorite = Favorite.all
    # @favorites = favorite.joins(:favorites).where(favorites: {user_id: params[:user_id] })
  end
  
  def create
  favorite = current_user.favorites.create(feed_id: params[:feed_id])
  redirect_to feeds_path, notice: "#{favorite.feed.user.name}さんのブログをお気に入り登録しました"
  # current_user.favorites.create(feed_id: params[:feed_id])
  #   redirect_to [:feed, {id: params[:feed_id] }]
  end

  # def destroy
  # current_user.favorites.find_by(feed_id: params[:feed_id]).destroy
  #   redirect_to [:feed, {id: params[:feed_id] }]
  # end



  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to feeds_path, notice: "#{favorite.feed.user.name}さんのブログをお気に入り解除しました"
  end
end