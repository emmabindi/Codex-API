class AddCategoryToCategorizable < ActiveRecord::Migration[6.0]
  def change
    add_reference :categorizables, :category, null: false, foreign_key: true
  end
end
