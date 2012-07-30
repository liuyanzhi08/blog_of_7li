class Comment < ActiveRecord::Base
  attr_accessible :content, :nick_name
  belongs_to :blog
  validates_presence_of :content, :message => "shouln't be blank, right?"
end
