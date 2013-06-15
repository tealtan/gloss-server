class Highlight < ActiveRecord::Base
  validates :selectedtext, :pageurl, :presence => true
end
