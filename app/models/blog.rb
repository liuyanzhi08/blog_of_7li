class Blog < ActiveRecord::Base
  attr_accessible :content, :title
  acts_as_taggable
  validates_presence_of :title, :content
  has_many :comments
end
