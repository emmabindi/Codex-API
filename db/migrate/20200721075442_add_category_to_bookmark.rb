class AddCategoryToBookmark < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookmarks, :category, null: false, foreign_key: true
  end
end
