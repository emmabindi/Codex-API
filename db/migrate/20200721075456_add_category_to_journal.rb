class AddCategoryToJournal < ActiveRecord::Migration[6.0]
  def change
    add_reference :journals, :category, null: false, foreign_key: true
  end
end
