class RemoveCategoryFromJournals < ActiveRecord::Migration[6.0]
  def change
    remove_column :journals, :category, :name
  end
end
