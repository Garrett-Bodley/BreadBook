class BookmarksController < ApplicationController
  before_action :please_log_in

  def create
    @bookmark = @current_user.bookmarks.create(bookmark_params)
    redirect_to @bookmark.bookmarkable
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    unless @bookmark.user = current_user
      redirect_to @bookmark.bookmarkable, alert: "You do not have permission to do that"
    end
    object = @bookmark.bookmarkable
    @bookmark.destroy
    redirect_to object
  end

  def saved_ingredients
    @ingredients = current_user.saved_ingredients.order(:asc).page(params[:page]).per(30)
  end

  def saved_recipes
    @recipes = current_user.saved_recipes.order(:asc).page(params[:page]).per(30)
  end

  def saved_posts
    @posts = current_user.saved_posts.order(:asc).page(params[:page]).per(30)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:bookmarkable_id, :bookmarkable_type)
  end

end
