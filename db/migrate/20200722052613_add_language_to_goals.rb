class AddLanguageToGoals < ActiveRecord::Migration[6.0]
  def change
    add_reference :goals, :language, null: false, foreign_key: true
  end
end
