class AddLanguageToBookmark < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookmarks, :language, null: false, foreign_key: true
  end
end
