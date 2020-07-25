class UpdateForeignKeyBookmarks < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :bookmarks, :users
    add_foreign_key :bookmarks, :users, on_delete: :cascade
  end
end
