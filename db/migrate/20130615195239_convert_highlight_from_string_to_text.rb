class ConvertHighlightFromStringToText < ActiveRecord::Migration
  def up
      change_column :highlights, :selected_text, :text
      change_column :highlights, :surrounding_text, :text
  end
  def down
      # This might cause trouble if you have strings longer
      # than 255 characters.
      change_column :highlights, :selected_text, :string
      change_column :highlights, :surrounding_text, :text
  end
end
