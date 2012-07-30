class Blog < ActiveRecord::Base
  attr_accessible :content, :title
  acts_as_taggable
  has_many :comments
end
