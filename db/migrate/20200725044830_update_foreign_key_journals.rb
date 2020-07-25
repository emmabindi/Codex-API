class UpdateForeignKeyJournals < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :journals, :users
    add_foreign_key :journals, :users, on_delete: :cascade
  end
end
