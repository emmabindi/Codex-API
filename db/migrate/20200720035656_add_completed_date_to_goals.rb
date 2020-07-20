class AddCompletedDateToGoals < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :completed_date, :date
  end
end
