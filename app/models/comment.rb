class Comment < ActiveRecord::Base
  attr_accessible :content, :nick_name
  belongs_to :blog
end
