class BookmarksController < ApplicationController

  def create
    @bookmark = @user.bookmarks.create(bookmark_params)
    redirect_to @bookmark.bookmarkable
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    object = @bookmark.bookmarkable
    @bookmark.destroy
    redirect_to object
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:bookmarkable_id, :bookmarkable_type)
  end
end
