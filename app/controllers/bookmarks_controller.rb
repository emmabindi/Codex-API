class BookmarksController < ApplicationController
  before_action :authenticate_user
  before_action :set_bookmark, only: [:show, :update, :destroy]

  def index
    bookmarks = current_user.bookmarks
    render json: { bookmarks: bookmarks, current_user: current_user.username}
  end

  def show
    render json: @bookmark
  end

  def create
    bookmark = current_user.bookmarks.create(bookmark_params)
    render json: bookmark, status: 200
  end

  def update
    @bookmark.update(bookmark_params)
    render json: 'Bookmark Updated', status: 200
  end

  def destroy
    @bookmark.destroy
    render json: "Bookmark Deleted", status: 200
  end

  private
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:title, :description, :url, :user_id)
  end
end
