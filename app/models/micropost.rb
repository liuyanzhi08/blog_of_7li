class Micropost < ActiveRecord::Base
  attr_accessible :content
  validates_presence_of :content
  belongs_to :user
end
