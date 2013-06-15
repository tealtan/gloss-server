class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.string :selected_text
      t.string :surrounding_text
      t.string :page_url
      t.integer :user_id

      t.timestamps
    end
  end
end
