class RemoveCategoryFromGoals < ActiveRecord::Migration[6.0]
  def change
    remove_column :goals, :category, :name
  end
end
