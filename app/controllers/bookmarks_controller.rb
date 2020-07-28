class BookmarksController < ApplicationController
  before_action :authenticate_user
  before_action :set_bookmark, only: %i[show update destroy]

  def index
    bookmarks = current_user.bookmarks.order(created_at: 'desc').paginate(page: params[:page])
    render json: {
      bookmarks: bookmarks.as_json(include: %i[category language]),
      total_entries: current_user.bookmarks.length,
      current_user: current_user.username
    }
  end

  def show
    render json: @bookmark
  end

  def create
    bookmark = current_user.bookmarks.create(bookmark_params)

    if bookmark.save
      render json: bookmark, status: :created
    else
      render json: { errors: bookmark.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @bookmark.update(bookmark_params)
    render json: 'Bookmark Updated', status: :ok
  end

  def destroy
    @bookmark.delete
    render json: 'Bookmark Deleted', status: :no_content
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(
      :title,
      :description,
      :url,
      :user_id,
      :category_id,
      :language_id
    )
  end
end
