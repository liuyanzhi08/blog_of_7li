class Micropost < ActiveRecord::Base
  attr_accessible :content
  validates_presence_of :content, :message => "shouldn't be blank, right?"
  belongs_to :user
end
