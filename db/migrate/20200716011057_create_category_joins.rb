class CreateCategoryJoins < ActiveRecord::Migration[6.0]
  def change
    create_table :category_joins do |t|
      t.references :categorizable, polymorphic: true, null: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
