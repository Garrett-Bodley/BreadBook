class BookmarksController < ApplicationController

  def create
    @bookmark = @current_user.bookmarks.create(bookmark_params)
    redirect_to @bookmark.bookmarkable
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    object = @bookmark.bookmarkable
    @bookmark.destroy
    redirect_to object
  end

  def saved_ingredients
    @ingredients = current_user.saved_ingredients
  end

  def saved_recipes
    @recipes = current_user.saved_recipes
  end

  def saved_posts
    @posts = current_user.saved_posts
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:bookmarkable_id, :bookmarkable_type)
  end
end
