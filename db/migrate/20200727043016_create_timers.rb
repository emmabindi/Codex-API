class CreateTimers < ActiveRecord::Migration[6.0]
  def change
    create_table :timers do |t|
      t.integer :time_length

      t.timestamps
    end
  end
end
