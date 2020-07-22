class RemoveCategoryFromBookmarks < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookmarks, :category_id
  end
end
