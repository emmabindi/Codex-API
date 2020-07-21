class DeleteCategoryJoinsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :category_joins
  end
end
