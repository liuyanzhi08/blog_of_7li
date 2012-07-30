class Comment < ActiveRecord::Base
  attr_accessible :content, :nick_name
  validates_presence_of :content,
                        :message => "shouln't be blank, right?"
  belongs_to :blog
  has_many :notices
  has_many :users, :through => :notices
end
