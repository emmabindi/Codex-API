class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :title
      t.text :body
      t.string :due_date
      t.string :date

      t.timestamps
    end
  end
end
