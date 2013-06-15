class Highlight < ActiveRecord::Base
  validates :selected_text, :surrounding_text, :page_url, :page_title, :user_id, :presence => true
  validates :user_id, :numericality => { :only_integer => true }
end
