class FavoritesController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blog_path(@blog), notice: "いいね！しました"
  end

  def destroy
    @blog = Blog.find(params[:id])
    favorites = current_user.favorites.find_by(blog_id: @blog).destroy
    redirect_to blog_path(@blog)
  end

  def index
    @favorites = Favorite.where(user_id: current_user.id).all
  end

end
