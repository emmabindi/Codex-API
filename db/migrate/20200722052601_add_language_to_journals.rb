class AddLanguageToJournals < ActiveRecord::Migration[6.0]
  def change
    add_reference :journals, :language, null: false, foreign_key: true
  end
end
