class Message < ActiveRecord::Base
  attr_accessible :content
  validates_presence_of :content, :message => "shouln't be blank, right?"
  belongs_to :user
end
