class UpdateForeignKeyGoals < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :goals, :users
    add_foreign_key :goals, :users, on_delete: :cascade
  end
end
