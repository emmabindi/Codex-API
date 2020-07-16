class CreateCategorizables < ActiveRecord::Migration[6.0]
  def change
    create_table :categorizables do |t|
      t.references :categorizable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
