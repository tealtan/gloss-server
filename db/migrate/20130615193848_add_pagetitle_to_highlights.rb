class AddPagetitleToHighlights < ActiveRecord::Migration
  def change
    add_column :highlights, :page_title, :string
  end
end
