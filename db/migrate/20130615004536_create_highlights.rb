class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.text :selectedtext
      t.string :pageurl

      t.timestamps
    end
  end
end
