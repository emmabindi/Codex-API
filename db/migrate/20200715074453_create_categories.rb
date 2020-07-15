class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.references :categorizable, polymorphic: true, null: false
      t.string :name

      t.timestamps
    end
  end
end
