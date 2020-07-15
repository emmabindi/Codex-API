class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
